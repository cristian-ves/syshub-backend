package com.syshub.modules.repo.dtos;

import lombok.Data;

@Data
public class AttachmentDTO {
    private Integer id;
    private String originalName;
    private String fileType;
    private String fileName;
}