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
                .codigo(course.getCodigo())
                .nombre(course.getNombre())
                .creditos(course.getCreditos())
                .obligatorio(course.getObligatorio())
                .areaNombre(course.getArea().getNombre())
                .areaColor(course.getArea().getColor())
                .semestre(course.getSemester().getNumero())
                .pensumNombre(course.getSemester().getPensum().getNombre())
                .build();
    }

    public TagResponseDTO toTagDTO(Tag tag) {
        if (tag == null) return null;

        TagResponseDTO dto = new TagResponseDTO();
        dto.setId(tag.getId());
        dto.setNombre(tag.getNombre());
        dto.setColor(tag.getColor());
        return dto;
    }
}