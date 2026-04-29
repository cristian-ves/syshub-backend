package com.syshub.modules.repo.dtos;

import lombok.Data;

@Data
public class AttachmentDTO {
    private Long id;
    private String nombreOriginal;
    private String tipoArchivo;
    private String nombreArchivo;
}