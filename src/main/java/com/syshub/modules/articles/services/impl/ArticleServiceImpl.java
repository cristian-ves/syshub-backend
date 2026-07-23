package com.syshub.modules.articles.services.impl;

import com.syshub.core.exceptions.AppException;
import com.syshub.modules.articles.dtos.*;
import com.syshub.modules.articles.entities.Article;
import com.syshub.modules.articles.entities.ArticleFavorite;
import com.syshub.modules.articles.entities.Comment;
import com.syshub.modules.articles.entities.Vote;
import com.syshub.modules.articles.mappers.ArticleMapper;
import com.syshub.modules.articles.repositories.ArticleFavoriteRepository;
import com.syshub.modules.articles.repositories.ArticleRepository;
import com.syshub.modules.articles.repositories.CommentRepository;
import com.syshub.modules.articles.repositories.VoteRepository;
import com.syshub.modules.articles.repositories.specifications.ArticleSpecifications;
import com.syshub.modules.articles.services.IArticleService;
import com.syshub.modules.catalog.entities.Course;
import com.syshub.modules.catalog.entities.Tag;
import com.syshub.modules.catalog.repositories.CourseRepository;
import com.syshub.modules.catalog.repositories.TagRepository;
import com.syshub.modules.identity.dtos.UserResponseDTO;
import com.syshub.modules.identity.entities.User;
import com.syshub.modules.identity.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.Normalizer;
import java.util.*;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ArticleServiceImpl implements IArticleService {

    private final ArticleRepository articleRepository;
    private final CourseRepository courseRepository;
    private final TagRepository tagRepository;
    private final UserRepository userRepository;
    private final VoteRepository voteRepository;
    private final ArticleMapper articleMapper;
    private final ArticleFavoriteRepository articleFavoriteRepository;
    private final CommentRepository commentRepository;

    @Override
    @Transactional
    public ArticleResponseDTO createArticle(ArticleRequestDTO request) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User author = userRepository.findByUsername(username)
                .orElseThrow(() -> new AppException("The user was not found", HttpStatus.NOT_FOUND));

        Course course = courseRepository.findById(request.getCourseId())
                .orElseThrow(() -> new AppException("The course was not found", HttpStatus.NOT_FOUND));

        String slug = generateSlug(request.getTitle());
        if (articleRepository.existsBySlug(slug)) {
            slug = slug + "-" + System.currentTimeMillis() % 1000;
        }

        Set<Tag> articleTags = request.getTags().stream()
                .map(tagInput -> tagRepository.findByNameIgnoreCase(tagInput.getNombre())
                        .orElseGet(() -> {
                            Tag newTag = new Tag();
                            newTag.setName(tagInput.getNombre());
                            newTag.setColor(tagInput.getColor() != null ? tagInput.getColor() : "#64748b");
                            return tagRepository.save(newTag);
                        }))
                .collect(Collectors.toSet());

        Article article = Article.builder()
                .title(request.getTitle())
                .slug(slug)
                .slug(request.getExcerpt())
                .content(request.getContent())
                .status(request.getStatus() != null && request.getStatus().equals("DRAFT")
                        ? Article.ArticleStatus.DRAFT : Article.ArticleStatus.PUBLISHED)
                .author(author)
                .course(course)
                .tags(articleTags)
                .build();

        return articleMapper.toDto(articleRepository.save(article), author.getId());
    }

    private String generateSlug(String input) {
        Pattern NONLATIN = Pattern.compile("[^\\w-]");
        Pattern WHITESPACE = Pattern.compile("[\\s+]");
        String nowhitespace = WHITESPACE.matcher(input).replaceAll("-");
        String normalized = Normalizer.normalize(nowhitespace, Normalizer.Form.NFD);
        String slug = NONLATIN.matcher(normalized).replaceAll("");
        return slug.toLowerCase(Locale.ENGLISH);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<ArticleResponseDTO> getArticles(String search, Integer courseId, String tag, String status, Pageable pageable) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        boolean isStaff = auth.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN") || a.getAuthority().equals("ROLE_ASSISTANT"));

        String finalStatus = status;

        if (!isStaff) {
            finalStatus = "PUBLISHED";
        } else {
            finalStatus = (status == null) ? "PUBLISHED" : status;
        }

        Specification<Article> spec = ArticleSpecifications.filterArticles(search, courseId, tag, finalStatus);
        UUID currentUserId = getCurrentUserId();
        return articleRepository.findAll(spec, pageable)
                .map(article -> articleMapper.toDto(article, currentUserId));
    }

    @Override
    @Transactional(readOnly = true)
    public ArticleDetailResponseDTO getArticleBySlug(String slug) {
        UUID currentUserId = getCurrentUserId();

        Article article = articleRepository.findBySlug(slug)
                .orElseThrow(() -> new AppException("The article was not found", HttpStatus.NOT_FOUND));

        ArticleResponseDTO baseDto = articleMapper.toDto(article, currentUserId);

        List<Comment> comments = commentRepository
                .findByTargetIdAndTargetTypeOrderByCreatedAtDesc(article.getId(), "ARTICLE");

        List<CommentResponseDTO> commentsDTO = comments.stream().map(comment -> {
            CommentResponseDTO dto = new CommentResponseDTO();
            dto.setId(comment.getId());
            dto.setContent(comment.getContent());
            dto.setCreatedAt(comment.getCreatedAt());

            UserResponseDTO userDto = new UserResponseDTO();
            userDto.setId(comment.getAuthor().getId());
            userDto.setUsername(comment.getAuthor().getUsername());
            userDto.setFullName(comment.getAuthor().getFullName());
            userDto.setRoleId(comment.getAuthor().getRole().getId());
            dto.setAuthor(userDto);

            return dto;
        }).collect(Collectors.toList());

        ArticleDetailResponseDTO detailDto = new ArticleDetailResponseDTO();
        BeanUtils.copyProperties(baseDto, detailDto);
        detailDto.setComments(commentsDTO);

        return detailDto;
    }

    @Override
    @Transactional
    public VoteResponseDTO voteArticle(Integer articleId, Integer value) {
        if (value != 1 && value != -1) {
            throw new AppException("The vote value must be 1 or -1", HttpStatus.BAD_REQUEST);
        }

        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new AppException("The user was not found", HttpStatus.NOT_FOUND));

        Article article = articleRepository.findById(articleId)
                .orElseThrow(() -> new AppException("The article was not found", HttpStatus.NOT_FOUND));

        if (article.getPoints() == null) {
            article.setPoints(0);
        }

        Optional<Vote> existingVote = voteRepository.findByUserIdAndTargetIdAndTargetType(
                user.getId(), articleId, "ARTICLE");

        int pointsAdjustment = 0;

        VoteResponseDTO dto = new VoteResponseDTO();

        if (existingVote.isPresent()) {
            Vote vote = existingVote.get();
            if (vote.getValue().equals(value)) {
                voteRepository.delete(vote);
                pointsAdjustment = -value;
                dto.setVote(0);
            } else {
                pointsAdjustment = value * 2;
                vote.setValue(value);
                voteRepository.save(vote);
                dto.setVote(value);
            }
        } else {
            Vote newVote = Vote.builder()
                    .user(user)
                    .targetId(articleId)
                    .targetType("ARTICLE")
                    .value(value)
                    .build();
            voteRepository.save(newVote);
            pointsAdjustment = value;
            dto.setVote(value);
        }

        article.setPoints(article.getPoints() + pointsAdjustment);
        articleRepository.save(article);

        dto.setArticleId(article.getId());
        dto.setNewPoints(article.getPoints());

        return dto;
    }

    @Override
    @Transactional
    public void toggleFavorite(Integer articleId) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new AppException("The user was not found", HttpStatus.NOT_FOUND));

        Article article = articleRepository.findById(articleId)
                .orElseThrow(() -> new AppException("The article was not found", HttpStatus.NOT_FOUND));

        Optional<ArticleFavorite> favorite = articleFavoriteRepository
                .findByUserIdAndArticleId(user.getId(), articleId);

        if (favorite.isPresent()) {
            articleFavoriteRepository.delete(favorite.get());
        } else {
            ArticleFavorite newFavorite = ArticleFavorite.builder()
                    .user(user)
                    .article(article)
                    .build();
            articleFavoriteRepository.save(newFavorite);
        }
    }

    @Override
    @Transactional
    public ArticleResponseDTO updateArticle(Integer id, ArticleRequestDTO request) {
        Article article = articleRepository.findById(id)
                .orElseThrow(() -> new AppException("The article was not found", HttpStatus.NOT_FOUND));

        UUID currentUserId = getCurrentUserId();

        boolean isAdmin = SecurityContextHolder.getContext().getAuthentication().getAuthorities()
                .stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));

        if (!article.getAuthor().getId().equals(currentUserId) && !isAdmin) {
            throw new AppException("You don't have the permit to edit this article", HttpStatus.FORBIDDEN);
        }

        article.setTitle(request.getTitle());
        article.setContent(request.getContent());
        article.setSlug(request.getExcerpt());
        article.setStatus(Article.ArticleStatus.valueOf(request.getStatus()));

        return articleMapper.toDto(articleRepository.save(article), currentUserId);
    }

    @Override
    @Transactional
    public void deleteArticle(Integer id) {
        Article article = articleRepository.findById(id)
                .orElseThrow(() -> new AppException("The article was not found", HttpStatus.NOT_FOUND));

        UUID currentUserId = getCurrentUserId();
        boolean isAdmin = SecurityContextHolder.getContext().getAuthentication().getAuthorities()
                .stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));

        if (!article.getAuthor().getId().equals(currentUserId) && !isAdmin) {
            throw new AppException("You don't have the permit to delete this article", HttpStatus.FORBIDDEN);
        }

        articleRepository.delete(article);
    }

    private UUID getCurrentUserId() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated() || auth instanceof AnonymousAuthenticationToken) {
            return null;
        }
        return userRepository.findByUsername(auth.getName())
                .map(User::getId)
                .orElse(null);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<ArticleResponseDTO> getMyFavoriteArticles(Pageable pageable) {
        UUID currentUserId = getCurrentUserId();
        if (currentUserId == null) {
            throw new AppException("You must be authenticated to see your favorite articles", HttpStatus.UNAUTHORIZED);
        }

        return articleFavoriteRepository.findByUserId(currentUserId, pageable)
                .map(favorite -> {
                    ArticleResponseDTO dto = articleMapper.toDto(favorite.getArticle(), currentUserId);
                    dto.setFavorite(true);
                    return dto;
                });
    }

    @Override
    @Transactional
    public CommentResponseDTO addComment(Integer articleId, CommentRequestDTO request) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new AppException("The user was not found", HttpStatus.NOT_FOUND));

        Article article = articleRepository.findById(articleId)
                .orElseThrow(() -> new AppException("The user was nopt found", HttpStatus.NOT_FOUND));

        Comment comment = Comment.builder()
                .content(request.getContenido())
                .author(user)
                .targetId(article.getId())
                .targetType("ARTICLE")
                .build();

        comment = commentRepository.save(comment);

        CommentResponseDTO dto = new CommentResponseDTO();
        dto.setId(comment.getId());
        dto.setContent(comment.getContent());
        dto.setCreatedAt(comment.getCreatedAt());

        UserResponseDTO userDto = new UserResponseDTO();
        userDto.setId(user.getId());
        userDto.setUsername(user.getUsername());
        userDto.setFullName(user.getFullName());
        userDto.setRoleId(user.getRole().getId());

        dto.setAuthor(userDto);

        return dto;
    }

    @Override
    @Transactional
    public void deleteComment(Integer commentId) {
        Comment comment = commentRepository.findById(commentId)
                .orElseThrow(() -> new AppException("The comment was not found", HttpStatus.NOT_FOUND));

        commentRepository.delete(comment);
    }
}