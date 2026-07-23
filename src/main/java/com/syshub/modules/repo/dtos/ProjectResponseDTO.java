package com.syshub.modules.repo.dtos;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;

@Data
public class ProjectResponseDTO {
    private Integer id;
    private String title;
    private String description;
    private String repoUrl;
    private boolean featured;
    private String authorName;
    private String courseName;
    private String areaName;
    private String areaColor;
    private String studyPlanName;
    private Set<RepositoryTagDTO> tags;
    private List<AttachmentDTO> files;
    private LocalDateTime uploadDate;
}