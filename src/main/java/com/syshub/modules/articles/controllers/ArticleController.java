package com.syshub.modules.articles.controllers;

import com.syshub.modules.articles.dtos.ArticleRequestDTO;
import com.syshub.modules.articles.dtos.ArticleResponseDTO;
import com.syshub.modules.articles.services.IArticleService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
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
}