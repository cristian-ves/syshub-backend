package com.syshub.modules.articles.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VoteResponseDTO {
    private Integer articleId;
    private Integer newPoints;
    private Integer vote;
}
