package com.syshub.modules.identity.repositories;

import com.syshub.modules.identity.entities.Major;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface MajorRepository extends JpaRepository<Major, Integer> {
    Optional<Major> findMajorByName(String name);
}