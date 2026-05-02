package com.syshub.modules.articles.repositories;

import com.syshub.modules.articles.entities.ArticleFavorite;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;
import java.util.UUID;

public interface ArticleFavoriteRepository extends JpaRepository<ArticleFavorite, Integer> {
    Optional<ArticleFavorite> findByUsuarioIdAndArticuloId(UUID usuarioId, Integer articuloId);
    Page<ArticleFavorite> findByUsuarioId(UUID usuarioId, Pageable pageable);
}