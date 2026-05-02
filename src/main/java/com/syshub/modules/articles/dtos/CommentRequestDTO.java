package com.syshub.modules.articles.dtos;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class CommentRequestDTO {
    @NotBlank(message = "El comentario no puede estar vacío")
    private String contenido;
}