package com.syshub.modules.catalog.dtos;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class CourseResponseDTO {
    private Integer id;
    private String code;
    private String name;
    private Integer credits;
    private Boolean required;
    private String areaName;
    private String areaColor;
    private Integer semester;
    private String studyPlanName;
}