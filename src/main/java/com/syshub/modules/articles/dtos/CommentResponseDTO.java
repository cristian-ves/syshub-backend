package com.syshub.modules.articles.dtos;

import com.syshub.modules.identity.dtos.UserResponseDTO;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CommentResponseDTO {
    private Integer id;
    private String content;
    private UserResponseDTO author;
    private LocalDateTime createdAt;
}