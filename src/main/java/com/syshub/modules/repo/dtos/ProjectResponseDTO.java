package com.syshub.modules.repo.dtos;

import com.syshub.modules.catalog.dtos.TagResponseDTO;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;

@Data
public class ProjectResponseDTO {
    private Integer id;
    private String titulo;
    private String descripcion;
    private String repoUrl;
    private boolean destacado;
    private String autorNombre;
    private String cursoNombre;
    private String areaNombre;
    private String areaColor;
    private String pensumNombre;
    private Set<RepositoryTagDTO> tags;
    private List<AttachmentDTO> archivos;
    private LocalDateTime fechaSubida;
}