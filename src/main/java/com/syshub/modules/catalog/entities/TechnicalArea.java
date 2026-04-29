package com.syshub.modules.catalog.entities;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "areas_tecnicas")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TechnicalArea {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String nombre;

    @Column(columnDefinition = "TEXT")
    private String descripcion;

    @Column(length = 7)
    private String color;
}