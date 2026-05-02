package com.syshub.modules.catalog.services;

import com.syshub.modules.catalog.dtos.CourseResponseDTO;
import com.syshub.modules.catalog.dtos.TagResponseDTO;
import com.syshub.modules.catalog.entities.Pensum;
import com.syshub.modules.catalog.entities.Semester;
import com.syshub.modules.catalog.entities.Tag;
import com.syshub.modules.catalog.entities.TechnicalArea;

import java.util.List;

public interface ICatalogService {
    List<Pensum> getAllPensums();
    List<Semester> getSemestersByPensum(Integer pensumId);
    List<TechnicalArea> getAllAreas();
    List<TagResponseDTO> getAllTags();
    List<CourseResponseDTO> getCoursesBySemester(Integer semesterNum);
    List<CourseResponseDTO> searchCourses(String query);
    TagResponseDTO saveTag(Tag tagId);
}