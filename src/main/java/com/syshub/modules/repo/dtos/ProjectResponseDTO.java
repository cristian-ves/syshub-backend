package com.syshub.modules.repo.dtos;

import lombok.Data;
import java.util.List;
import java.util.Set;

@Data
public class ProjectResponseDTO {
    private Long id;
    private String titulo;
    private String descripcion;
    private String repoUrl;
    private boolean destacado;
    private String autorNombre;
    private String cursoNombre;
    private Set<String> tags;
    private List<AttachmentDTO> archivos;
}