package com.syshub.modules.catalog.repositories;

import com.syshub.modules.catalog.entities.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface CourseRepository extends JpaRepository<Course, Integer> {

    List<Course> findBySemesterNumber(Integer semesterId);

    List<Course> findByAreaId(Integer areaId);

    List<Course> findByNameContainingIgnoreCaseOrCodeContainingIgnoreCase(String name, String code);
}