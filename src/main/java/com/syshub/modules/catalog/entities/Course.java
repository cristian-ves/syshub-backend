package com.syshub.modules.catalog.entities;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "courses")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "code", nullable = false)
    private String codigo;

    @Column(name = "name", nullable = false)
    private String nombre;

    @Column(name = "credits", nullable = false)
    private Integer creditos;

    @Column(name = "required", nullable = false)
    private Boolean obligatorio;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "semester_id", nullable = false)
    private Semester semester;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "area_id", nullable = false)
    private TechnicalArea area;
}