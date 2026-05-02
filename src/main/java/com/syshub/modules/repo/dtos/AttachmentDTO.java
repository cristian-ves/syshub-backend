package com.syshub.modules.repo.dtos;

import lombok.Data;

@Data
public class AttachmentDTO {
    private Integer id;
    private String nombreOriginal;
    private String tipoArchivo;
    private String nombreArchivo;
}