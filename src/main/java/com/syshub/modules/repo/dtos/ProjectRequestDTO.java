package com.syshub.modules.repo.dtos;

import lombok.Data;
import java.util.List;

@Data
public class ProjectRequestDTO {
    private String titulo;
    private String descripcion;
    private String repoUrl;
    private Integer courseId;
    private List<RepositoryTagDTO> tags;
}