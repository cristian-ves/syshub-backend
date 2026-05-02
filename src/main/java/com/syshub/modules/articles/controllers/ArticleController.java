package com.syshub.modules.articles.controllers;

import com.syshub.core.exceptions.AppException;
import com.syshub.modules.articles.dtos.ArticleRequestDTO;
import com.syshub.modules.articles.dtos.ArticleResponseDTO;
import com.syshub.modules.articles.services.IArticleService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/articles")
@RequiredArgsConstructor
public class ArticleController {

    private final IArticleService articleService;

    @PostMapping
    @PreAuthorize("hasAnyRole('ROLE_AUXILIAR', 'ROLE_ADMIN')")
    public ResponseEntity<ArticleResponseDTO> createArticle(@Valid @RequestBody ArticleRequestDTO request) {
        return new ResponseEntity<>(articleService.createArticle(request), HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<Page<ArticleResponseDTO>> getArticles(
            @RequestParam(required = false) String search,
            @RequestParam(required = false) Long courseId,
            @RequestParam(required = false) String tag,
            @RequestParam(defaultValue = "PUBLISHED") String status,
            @PageableDefault(size = 10, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable
    ) {
        return ResponseEntity.ok(articleService.getArticles(search, courseId, tag, status, pageable));
    }

    @GetMapping("/{slug}")
    public ResponseEntity<ArticleResponseDTO> getBySlug(@PathVariable String slug) {
        return ResponseEntity.ok(articleService.getArticleBySlug(slug));
    }

    @PostMapping("/{id}/vote")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<Void> voteArticle(
            @PathVariable Long id,
            @RequestParam Integer value
    ) {

        articleService.voteArticle(id, value);
        return ResponseEntity.ok().build();
    }
}