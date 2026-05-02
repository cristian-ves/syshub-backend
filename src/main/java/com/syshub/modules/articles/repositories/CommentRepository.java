package com.syshub.modules.articles.repositories;

import com.syshub.modules.articles.entities.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Integer> {
    List<Comment> findByTargetIdAndTargetTypeOrderByCreatedAtDesc(Integer targetId, String targetType);
}