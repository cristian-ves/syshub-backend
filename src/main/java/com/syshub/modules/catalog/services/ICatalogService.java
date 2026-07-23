package com.syshub.modules.catalog.services;

import com.syshub.modules.catalog.dtos.CourseResponseDTO;
import com.syshub.modules.catalog.dtos.TagResponseDTO;
import com.syshub.modules.catalog.entities.StudyPlan;
import com.syshub.modules.catalog.entities.Semester;
import com.syshub.modules.catalog.entities.Tag;
import com.syshub.modules.catalog.entities.TechnicalArea;

import java.util.List;

public interface ICatalogService {
    List<StudyPlan> getAllStudyPlans();
    List<Semester> getSemestersByStudyPlan(Integer studyPlanId);
    List<TechnicalArea> getAllAreas();
    List<TagResponseDTO> getAllTags();
    List<CourseResponseDTO> getCoursesBySemester(Integer semesterNum);
    List<CourseResponseDTO> searchCourses(String query);
    TagResponseDTO saveTag(Tag tagId);
}