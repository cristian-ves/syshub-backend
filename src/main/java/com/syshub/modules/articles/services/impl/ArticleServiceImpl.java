package com.syshub.modules.articles.services.impl;

import com.syshub.core.exceptions.AppException;
import com.syshub.modules.articles.dtos.ArticleRequestDTO;
import com.syshub.modules.articles.dtos.ArticleResponseDTO;
import com.syshub.modules.articles.entities.Article;
import com.syshub.modules.articles.mappers.ArticleMapper;
import com.syshub.modules.articles.repositories.ArticleRepository;
import com.syshub.modules.articles.services.IArticleService;
import com.syshub.modules.catalog.entities.Course;
import com.syshub.modules.catalog.entities.Tag;
import com.syshub.modules.catalog.repositories.CourseRepository;
import com.syshub.modules.catalog.repositories.TagRepository;
import com.syshub.modules.identity.entities.User;
import com.syshub.modules.identity.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.Normalizer;
import java.util.Locale;
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
}