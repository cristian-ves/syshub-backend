package com.syshub.modules.catalog.repositories;

import com.syshub.modules.catalog.entities.Tag;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TagRepository extends JpaRepository<Tag, Long> {
}