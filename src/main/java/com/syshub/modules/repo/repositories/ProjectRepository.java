package com.syshub.modules.repo.repositories;

import com.syshub.modules.repo.entities.Project;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface ProjectRepository extends JpaRepository<Project, Long>, JpaSpecificationExecutor<Project> {
    List<Project> findByCursoId(Long courseId);
    List<Project> findByDestacadoTrue();
}