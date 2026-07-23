package com.syshub.modules.catalog.entities;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "technical_areas")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TechnicalArea {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name", unique = true, nullable = false)
    private String name;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    @Column(length = 7)
    private String color;
}