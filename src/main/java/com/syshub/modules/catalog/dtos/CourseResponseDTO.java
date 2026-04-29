package com.syshub.modules.catalog.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CourseResponseDTO {
    private Long id;
    private String codigo;
    private String nombre;
    private Integer creditos;
    private Boolean obligatorio;
    private String areaNombre;
    private String areaColor;
    private Integer semestre;
    private String pensumNombre;
}