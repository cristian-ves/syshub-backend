package com.syshub.modules.catalog.repositories;

import com.syshub.modules.catalog.entities.TechnicalArea;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TechnicalAreaRepository extends JpaRepository<TechnicalArea, Integer> {
}