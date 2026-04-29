package com.syshub.modules.catalog.entities;

import com.syshub.modules.identity.entities.Carrera;
import jakarta.persistence.*;
import lombok.*;
@Entity
@Table(name = "pensums")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pensum {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String nombre;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_carrera")
    private Carrera carrera;
}