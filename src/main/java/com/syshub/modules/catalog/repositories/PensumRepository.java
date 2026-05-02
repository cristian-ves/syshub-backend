package com.syshub.modules.catalog.repositories;

import com.syshub.modules.catalog.entities.Pensum;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface PensumRepository extends JpaRepository<Pensum, Integer> {
    List<Pensum> findByCarreraId(Integer carreraId);
}