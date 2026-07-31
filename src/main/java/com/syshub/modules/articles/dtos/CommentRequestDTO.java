package com.syshub.modules.articles.dtos;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class CommentRequestDTO {
    @NotBlank(message = "The comment cannot be empty")
    private String content;
}