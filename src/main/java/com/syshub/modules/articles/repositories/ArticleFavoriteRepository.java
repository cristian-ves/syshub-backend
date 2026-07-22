package com.syshub.modules.articles.repositories;

import com.syshub.modules.articles.entities.ArticleFavorite;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;
import java.util.UUID;

public interface ArticleFavoriteRepository extends JpaRepository<ArticleFavorite, Integer> {
    Optional<ArticleFavorite> findByUserIdAndArticleId(UUID userId, Integer articleId);
    Page<ArticleFavorite> findByUserId(UUID userId, Pageable pageable);
}