package com.syshub.modules.catalog.repositories;

import com.syshub.modules.catalog.entities.Tag;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface TagRepository extends JpaRepository<Tag, Integer> {
    Optional<Tag> findByNombreIgnoreCase(String nombre);
}