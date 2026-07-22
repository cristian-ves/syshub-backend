package com.syshub.modules.articles.dtos;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class ArticleDetailResponseDTO extends ArticleResponseDTO {
    private List<CommentResponseDTO> comments;
}