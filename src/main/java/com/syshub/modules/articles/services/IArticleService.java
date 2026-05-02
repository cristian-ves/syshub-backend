package com.syshub.modules.articles.services;

import com.syshub.modules.articles.dtos.ArticleRequestDTO;
import com.syshub.modules.articles.dtos.ArticleResponseDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface IArticleService {
    ArticleResponseDTO createArticle(ArticleRequestDTO request);

    Page<ArticleResponseDTO> getArticles(String search, Long courseId, String tag, String status, Pageable pageable);

    ArticleResponseDTO getArticleBySlug(String slug);

    void voteArticle(Long articleId, Integer value);
}