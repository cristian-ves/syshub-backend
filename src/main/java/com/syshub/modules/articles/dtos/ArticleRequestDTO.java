package com.syshub.modules.articles.dtos;

import com.syshub.modules.repo.dtos.RepositoryTagDTO;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import java.util.Set;

@Data
public class ArticleRequestDTO {
    @NotBlank(message = "The title is required")
    private String title;

    private String excerpt;

    @NotBlank(message = "The content cannot be empty")
    private String content;

    @NotNull(message = "The article must be asigned to a course")
    private Integer courseId;

    private Set<RepositoryTagDTO> tags;

    private String status;
}