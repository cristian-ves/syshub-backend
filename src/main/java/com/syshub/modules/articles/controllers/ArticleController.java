package com.syshub.modules.articles.controllers;

import com.syshub.core.exceptions.AppException;
import com.syshub.modules.articles.dtos.*;
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
            @RequestParam(required = false) Integer courseId,
            @RequestParam(required = false) String tag,
            @RequestParam(defaultValue = "PUBLISHED") String status,
            @PageableDefault(size = 10, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable
    ) {
        return ResponseEntity.ok(articleService.getArticles(search, courseId, tag, status, pageable));
    }

    @GetMapping("/{slug}")
    public ResponseEntity<ArticleDetailResponseDTO> getBySlug(@PathVariable String slug) {
        return ResponseEntity.ok(articleService.getArticleBySlug(slug));
    }

    @PostMapping("/{id}/vote")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<VoteResponseDTO> voteArticle(
            @PathVariable Integer id,
            @RequestParam Integer value
    ) {

        return ResponseEntity.ok(articleService.voteArticle(id, value));
    }

    @PostMapping("/{id}/favorite")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<Void> toggleFavorite(@PathVariable Integer id) {
        articleService.toggleFavorite(id);
        return ResponseEntity.ok().build();
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ROLE_AUXILIAR', 'ROLE_ADMIN')")
    public ResponseEntity<ArticleResponseDTO> update(@PathVariable Integer id, @Valid @RequestBody ArticleRequestDTO request) {
        return ResponseEntity.ok(articleService.updateArticle(id, request));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ROLE_AUXILIAR', 'ROLE_ADMIN')")
    public ResponseEntity<Void> delete(@PathVariable Integer id) {
        articleService.deleteArticle(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/favorites")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<Page<ArticleResponseDTO>> getMyFavorites(
            @PageableDefault(size = 10, direction = Sort.Direction.DESC) Pageable pageable
    ) {
        return ResponseEntity.ok(articleService.getMyFavoriteArticles(pageable));
    }

    @PostMapping("/{id}/comments")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<CommentResponseDTO> addComment(
            @PathVariable Integer id,
            @Valid @RequestBody CommentRequestDTO request
    ) {
        return new ResponseEntity<>(articleService.addComment(id, request), HttpStatus.CREATED);
    }

    @DeleteMapping("/comments/{commentId}")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ResponseEntity<Void> deleteComment(@PathVariable Integer commentId) {
        articleService.deleteComment(commentId);
        return ResponseEntity.noContent().build();
    }
}