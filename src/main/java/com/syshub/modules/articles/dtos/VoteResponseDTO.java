package com.syshub.modules.articles.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class VoteResponseDTO {
    private Integer articleId;
    private Integer newPoints;
}
