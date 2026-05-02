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
    private String codigo;
    private String nombre;
    private Integer creditos;
    private Boolean obligatorio;
    private String areaNombre;
    private String areaColor;
    private Integer semestre;
    private String pensumNombre;
}