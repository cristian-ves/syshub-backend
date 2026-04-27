package com.syshub.modules.identity.repositories;

import com.syshub.modules.identity.entities.Carrera;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CarreraRepository extends JpaRepository<Carrera, Integer> {
    Optional<Carrera> findByNombre(String nombre);
}