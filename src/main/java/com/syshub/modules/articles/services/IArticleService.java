package com.syshub.modules.articles.services;

import com.syshub.modules.articles.dtos.ArticleRequestDTO;
import com.syshub.modules.articles.dtos.ArticleResponseDTO;

public interface IArticleService {
    ArticleResponseDTO createArticle(ArticleRequestDTO request);
}
