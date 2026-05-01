package com.syshub.modules.articles.dtos;

import com.syshub.modules.repo.dtos.RepositoryTagDTO;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import java.util.Set;

@Data
public class ArticleRequestDTO {
    @NotBlank(message = "El título es obligatorio")
    private String titulo;

    private String extracto;

    @NotBlank(message = "El contenido no puede estar vacío")
    private String contenido;

    @NotNull(message = "Debe asignar el artículo a un curso")
    private Long courseId;

    private Set<RepositoryTagDTO> tags;

    private String status;
}