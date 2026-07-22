package com.syshub.modules.articles.dtos;

import com.syshub.modules.catalog.dtos.CourseResponseDTO;
import com.syshub.modules.catalog.dtos.TagResponseDTO;
import com.syshub.modules.identity.dtos.UserResponseDTO;
import lombok.Data;
import java.time.LocalDateTime;
import java.util.Set;

@Data
public class ArticleResponseDTO {
    private Integer id;
    private String title;
    private String slug;
    private String excerpt;
    private String content;
    private String status;
    private LocalDateTime createdAt;
    private UserResponseDTO author;
    private CourseResponseDTO course;
    private Set<TagResponseDTO> tags;
    private Integer points;
    private boolean isFavorite;
    private Integer votes;
}