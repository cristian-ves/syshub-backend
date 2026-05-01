package com.syshub.modules.articles.dtos;

import com.syshub.modules.catalog.dtos.CourseResponseDTO;
import com.syshub.modules.catalog.dtos.TagResponseDTO;
import com.syshub.modules.identity.dtos.UserResponseDTO;
import lombok.Data;
import java.time.LocalDateTime;
import java.util.Set;

@Data
public class ArticleResponseDTO {
    private Long id;
    private String titulo;
    private String slug;
    private String extracto;
    private String contenido;
    private String status;
    private LocalDateTime createdAt;
    private UserResponseDTO autor;
    private CourseResponseDTO curso;
    private Set<TagResponseDTO> tags;
    private Integer puntos;
}