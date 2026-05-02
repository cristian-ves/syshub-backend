package com.syshub.modules.articles.services;

import com.syshub.modules.articles.dtos.ArticleRequestDTO;
import com.syshub.modules.articles.dtos.ArticleResponseDTO;
import com.syshub.modules.articles.dtos.VoteResponseDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface IArticleService {
    ArticleResponseDTO createArticle(ArticleRequestDTO request);

    Page<ArticleResponseDTO> getArticles(String search, Long courseId, String tag, String status, Pageable pageable);

    ArticleResponseDTO getArticleBySlug(String slug);

    VoteResponseDTO voteArticle(Long articleId, Integer value);
    void toggleFavorite(Long articleId);
    ArticleResponseDTO updateArticle(Long id, ArticleRequestDTO request);
    void deleteArticle(Long id);
    Page<ArticleResponseDTO> getMyFavoriteArticles(Pageable pageable);
}