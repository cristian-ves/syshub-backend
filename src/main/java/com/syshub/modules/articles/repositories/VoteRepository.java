package com.syshub.modules.articles.repositories;

import com.syshub.modules.articles.entities.Vote;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;
import java.util.UUID;

public interface VoteRepository extends JpaRepository<Vote, Long> {
    Optional<Vote> findByUsuarioIdAndTargetIdAndTargetType(UUID usuarioId, Long targetId, String targetType);
}