package com.syshub.modules.catalog.mappers;

import com.syshub.modules.catalog.dtos.CourseResponseDTO;
import com.syshub.modules.catalog.dtos.TagResponseDTO;
import com.syshub.modules.catalog.entities.Course;
import com.syshub.modules.catalog.entities.Tag;
import org.springframework.stereotype.Component;

@Component
public class CatalogMapper {

    public CourseResponseDTO toCourseDTO(Course course) {
        if (course == null) return null;

        return CourseResponseDTO.builder()
                .id(course.getId())
                .code(course.getCode())
                .name(course.getName())
                .credits(course.getCredits())
                .required(course.getRequired())
                .areaName(course.getArea().getName())
                .areaColor(course.getArea().getColor())
                .semester(course.getSemester().getNumber())
                .studyPlanName(course.getSemester().getStudyPlan().getName())
                .build();
    }

    public TagResponseDTO toTagDTO(Tag tag) {
        if (tag == null) return null;

        TagResponseDTO dto = new TagResponseDTO();
        dto.setId(tag.getId());
        dto.setName(tag.getName());
        dto.setColor(tag.getColor());
        return dto;
    }
}