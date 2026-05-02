package com.syshub.modules.articles.services.impl;

import com.syshub.core.exceptions.AppException;
import com.syshub.modules.articles.dtos.ArticleRequestDTO;
import com.syshub.modules.articles.dtos.ArticleResponseDTO;
import com.syshub.modules.articles.entities.Article;
import com.syshub.modules.articles.entities.Vote;
import com.syshub.modules.articles.mappers.ArticleMapper;
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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.Normalizer;
import java.util.Locale;
import java.util.Optional;
import java.util.Set;
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

        return articleMapper.toDto(articleRepository.save(article));
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
        return articleRepository.findAll(spec, pageable).map(articleMapper::toDto);
    }

    @Override
    @Transactional(readOnly = true)
    public ArticleResponseDTO getArticleBySlug(String slug) {
        Article article = articleRepository.findBySlug(slug)
                .orElseThrow(() -> new AppException("Artículo no encontrado", HttpStatus.NOT_FOUND));
        return articleMapper.toDto(article);
    }

    @Override
    @Transactional
    public void voteArticle(Long articleId, Integer value) {
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

        if (existingVote.isPresent()) {
            Vote vote = existingVote.get();
            if (vote.getValor().equals(value)) {
                voteRepository.delete(vote);
                pointsAdjustment = -value;
            } else {
                pointsAdjustment = value * 2;
                vote.setValor(value);
                voteRepository.save(vote);
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
        }

        article.setPuntos(article.getPuntos() + pointsAdjustment);
        articleRepository.save(article);
    }
}