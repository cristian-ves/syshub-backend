package com.syshub.modules.articles.services;

import com.syshub.modules.articles.dtos.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface IArticleService {
    ArticleResponseDTO createArticle(ArticleRequestDTO request);
    Page<ArticleResponseDTO> getArticles(String search, Integer courseId, String tag, String status, Pageable pageable);
    ArticleDetailResponseDTO getArticleBySlug(String slug);
    VoteResponseDTO voteArticle(Integer articleId, Integer value);
    void toggleFavorite(Integer articleId);
    ArticleResponseDTO updateArticle(Integer id, ArticleRequestDTO request);
    void deleteArticle(Integer id);
    Page<ArticleResponseDTO> getMyFavoriteArticles(Pageable pageable);
    CommentResponseDTO addComment(Integer articleId, CommentRequestDTO request);
    void deleteComment(Integer commentId);
}