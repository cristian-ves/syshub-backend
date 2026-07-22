package com.syshub.modules.catalog.entities;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.syshub.modules.identity.entities.Major;
import jakarta.persistence.*;
import lombok.*;
@Entity
@Table(name = "study_plans")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pensum {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String nombre;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "major_id")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private Major major;
}