package com.syshub.modules.catalog.repositories;

import com.syshub.modules.catalog.entities.StudyPlan;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface StudyPlanRepository extends JpaRepository<StudyPlan, Integer> {
    List<StudyPlan> findByMajorId(Integer majorId);
}