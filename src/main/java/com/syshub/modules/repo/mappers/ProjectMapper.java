package com.syshub.modules.repo.mappers;

import com.syshub.modules.repo.dtos.AttachmentDTO;
import com.syshub.modules.repo.dtos.ProjectResponseDTO;
import com.syshub.modules.repo.dtos.RepositoryTagDTO;
import com.syshub.modules.repo.entities.Project;
import org.springframework.stereotype.Component;
import java.util.stream.Collectors;
import java.util.ArrayList;

@Component
public class ProjectMapper {

    public ProjectResponseDTO toDto(Project project) {
        if (project == null) return null;

        ProjectResponseDTO dto = new ProjectResponseDTO();
        dto.setId(project.getId());
        dto.setTitle(project.getTitle());
        dto.setDescription(project.getDescription());
        dto.setRepoUrl(project.getRepoUrl());
        dto.setFeatured(project.isFeatured());
        dto.setAuthorName(project.getAuthor().getFullName());
        dto.setCourseName(project.getCourse().getName());
        dto.setStudyPlanName(project.getCourse().getSemester().getStudyPlan().getName());
        dto.setUploadDate(project.getUploadDate());
        dto.setAreaColor(project.getCourse().getArea().getColor());
        dto.setAreaName(project.getCourse().getArea().getName());

        dto.setTags(project.getTags().stream()
                .map(tag->{
                    RepositoryTagDTO tagDTO = new RepositoryTagDTO();
                    tagDTO.setName(tag.getName());
                    tagDTO.setColor(tag.getColor());
                    return tagDTO;
                })
                .collect(Collectors.toSet()));

        if (project.getFiles() != null) {
            dto.setFiles(project.getFiles().stream()
                    .map(att -> {
                        AttachmentDTO attDto = new AttachmentDTO();
                        attDto.setId(att.getId());
                        attDto.setOriginalName(att.getOriginalName());
                        attDto.setFileType(att.getFileType());
                        attDto.setFileName(att.getFileName());
                        return attDto;
                    })
                    .collect(Collectors.toList()));
        } else {
            dto.setFiles(new ArrayList<>());
        }

        return dto;
    }
}