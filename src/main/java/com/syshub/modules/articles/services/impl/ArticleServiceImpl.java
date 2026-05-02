package com.syshub.modules.articles.services.impl;

import com.syshub.core.exceptions.AppException;
import com.syshub.modules.articles.dtos.ArticleRequestDTO;
import com.syshub.modules.articles.dtos.ArticleResponseDTO;
import com.syshub.modules.articles.dtos.VoteResponseDTO;
import com.syshub.modules.articles.entities.Article;
import com.syshub.modules.articles.entities.ArticleFavorite;
import com.syshub.modules.articles.entities.Vote;
import com.syshub.modules.articles.mappers.ArticleMapper;
import com.syshub.modules.articles.repositories.ArticleFavoriteRepository;
import com.syshub.modules.articles.repositories.ArticleRepository;
import com.syshub.modules.articles.repositories.VoteRepository;
import com.syshub.modules.articles.repositories.specifications.ArticleSpecifications;
import com.syshub.modules.articles.services.IArticleService;
import com.syshub.modules.catalog.entities.Course;
import com.syshub.modules.catalog.entities.Tag;
import com.syshub.modules.catalog.repositories.CourseRepository;
import com.syshub.modules.catalog.repositories.TagRepository;
import com.syshub.modules.identity.entities.User;
import com.syshub.modules.identity.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
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
import java.util.Locale;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;
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

    @Override
    @Transactional
    public ArticleResponseDTO createArticle(ArticleRequestDTO request) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User author = userRepository.findByUsername(username)
                .orElseThrow(() -> new AppException("Usuario no encontrado", HttpStatus.NOT_FOUND));

        Course course = courseRepository.findById(request.getCourseId())
                .orElseThrow(() -> new AppException("Curso no encontrado", HttpStatus.NOT_FOUND));

        String slug = generateSlug(request.getTitulo());
        if (articleRepository.existsBySlug(slug)) {
            slug = slug + "-" + System.currentTimeMillis() % 1000;
        }

        Set<Tag> articleTags = request.getTags().stream()
                .map(tagInput -> tagRepository.findByNombreIgnoreCase(tagInput.getNombre())
                        .orElseGet(() -> {
                            Tag newTag = new Tag();
                            newTag.setNombre(tagInput.getNombre());
                            newTag.setColor(tagInput.getColor() != null ? tagInput.getColor() : "#64748b");
                            return tagRepository.save(newTag);
                        }))
                .collect(Collectors.toSet());

        Article article = Article.builder()
                .titulo(request.getTitulo())
                .slug(slug)
                .extracto(request.getExtracto())
                .contenido(request.getContenido())
                .status(request.getStatus() != null && request.getStatus().equals("DRAFT")
                        ? Article.ArticleStatus.DRAFT : Article.ArticleStatus.PUBLISHED)
                .autor(author)
                .curso(course)
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
    public Page<ArticleResponseDTO> getArticles(String search, Long courseId, String tag, String status, Pageable pageable) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        boolean isStaff = auth.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN") || a.getAuthority().equals("ROLE_AUXILIAR"));

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
    public ArticleResponseDTO getArticleBySlug(String slug) {
        UUID currentUserId = getCurrentUserId();
        Article article = articleRepository.findBySlug(slug)
                .orElseThrow(() -> new AppException("Artículo no encontrado", HttpStatus.NOT_FOUND));
        return articleMapper.toDto(article, currentUserId);
    }

    @Override
    @Transactional
    public VoteResponseDTO voteArticle(Long articleId, Integer value) {
        if (value != 1 && value != -1) {
            throw new AppException("El valor del voto debe ser 1 o -1", HttpStatus.BAD_REQUEST);
        }

        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new AppException("Usuario no encontrado", HttpStatus.NOT_FOUND));

        Article article = articleRepository.findById(articleId)
                .orElseThrow(() -> new AppException("Artículo no encontrado", HttpStatus.NOT_FOUND));

        if (article.getPuntos() == null) {
            article.setPuntos(0);
        }

        Optional<Vote> existingVote = voteRepository.findByUsuarioIdAndTargetIdAndTargetType(
                user.getId(), articleId, "ARTICULO");

        int pointsAdjustment = 0;

        VoteResponseDTO dto = new VoteResponseDTO();

        if (existingVote.isPresent()) {
            Vote vote = existingVote.get();
            if (vote.getValor().equals(value)) {
                voteRepository.delete(vote);
                pointsAdjustment = -value;
                dto.setVote(0);
            } else {
                pointsAdjustment = value * 2;
                vote.setValor(value);
                voteRepository.save(vote);
                dto.setVote(value);
            }
        } else {
            Vote newVote = Vote.builder()
                    .usuario(user)
                    .targetId(articleId)
                    .targetType("ARTICULO")
                    .valor(value)
                    .build();
            voteRepository.save(newVote);
            pointsAdjustment = value;
            dto.setVote(value);
        }

        article.setPuntos(article.getPuntos() + pointsAdjustment);
        articleRepository.save(article);

        dto.setArticleId(article.getId());
        dto.setNewPoints(article.getPuntos());

        return dto;
    }

    @Override
    @Transactional
    public void toggleFavorite(Long articleId) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new AppException("Usuario no encontrado", HttpStatus.NOT_FOUND));

        Article article = articleRepository.findById(articleId)
                .orElseThrow(() -> new AppException("Artículo no encontrado", HttpStatus.NOT_FOUND));

        Optional<ArticleFavorite> favorite = articleFavoriteRepository
                .findByUsuarioIdAndArticuloId(user.getId(), articleId);

        if (favorite.isPresent()) {
            articleFavoriteRepository.delete(favorite.get());
        } else {
            ArticleFavorite newFavorite = ArticleFavorite.builder()
                    .usuario(user)
                    .articulo(article)
                    .build();
            articleFavoriteRepository.save(newFavorite);
        }
    }

    @Override
    @Transactional
    public ArticleResponseDTO updateArticle(Long id, ArticleRequestDTO request) {
        Article article = articleRepository.findById(id)
                .orElseThrow(() -> new AppException("Artículo no encontrado", HttpStatus.NOT_FOUND));

        UUID currentUserId = getCurrentUserId();

        boolean isAdmin = SecurityContextHolder.getContext().getAuthentication().getAuthorities()
                .stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));

        if (!article.getAutor().getId().equals(currentUserId) && !isAdmin) {
            throw new AppException("No tienes permiso para editar este artículo", HttpStatus.FORBIDDEN);
        }

        article.setTitulo(request.getTitulo());
        article.setContenido(request.getContenido());
        article.setExtracto(request.getExtracto());
        article.setStatus(Article.ArticleStatus.valueOf(request.getStatus()));

        return articleMapper.toDto(articleRepository.save(article), currentUserId);
    }

    @Override
    @Transactional
    public void deleteArticle(Long id) {
        Article article = articleRepository.findById(id)
                .orElseThrow(() -> new AppException("Artículo no encontrado", HttpStatus.NOT_FOUND));

        UUID currentUserId = getCurrentUserId();
        boolean isAdmin = SecurityContextHolder.getContext().getAuthentication().getAuthorities()
                .stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));

        if (!article.getAutor().getId().equals(currentUserId) && !isAdmin) {
            throw new AppException("No tienes permiso para eliminar este artículo", HttpStatus.FORBIDDEN);
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
            throw new AppException("Debes estar autenticado para ver tus favoritos", HttpStatus.UNAUTHORIZED);
        }

        return articleFavoriteRepository.findByUsuarioId(currentUserId, pageable)
                .map(favorite -> {
                    ArticleResponseDTO dto = articleMapper.toDto(favorite.getArticulo(), currentUserId);
                    dto.setFavorite(true);
                    return dto;
                });
    }
}