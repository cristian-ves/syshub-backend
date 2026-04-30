package com.syshub.modules.catalog.repositories;

import com.syshub.modules.catalog.entities.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface CourseRepository extends JpaRepository<Course, Long> {

    List<Course> findBySemesterNumero(Long semesterId);

    List<Course> findByAreaId(Long areaId);

    List<Course> findByNombreContainingIgnoreCaseOrCodigoContainingIgnoreCase(String nombre, String codigo);
}