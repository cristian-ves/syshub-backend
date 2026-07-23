package com.syshub.modules.catalog.repositories;

import com.syshub.modules.catalog.entities.Semester;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface SemesterRepository extends JpaRepository<Semester, Integer> {
    List<Semester> findByPensumIdOrderByNumberAsc(Integer pensumId);
}