package com.syshub.modules.catalog.controllers;

import com.syshub.modules.catalog.dtos.CourseResponseDTO;
import com.syshub.modules.catalog.dtos.TagResponseDTO;
import com.syshub.modules.catalog.entities.Pensum;
import com.syshub.modules.catalog.entities.Semester;
import com.syshub.modules.catalog.entities.TechnicalArea;
import com.syshub.modules.catalog.services.ICatalogService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/catalog")
@RequiredArgsConstructor
public class CatalogController {

    private final ICatalogService catalogService;

    @GetMapping("/pensums")
    public ResponseEntity<List<Pensum>> getPensums() {
        return ResponseEntity.ok(catalogService.getAllPensums());
    }

    @GetMapping("/semesters")
    public ResponseEntity<List<Semester>> getSemesters(@RequestParam Integer pensumId) {
        return ResponseEntity.ok(catalogService.getSemestersByPensum(pensumId));
    }

    @GetMapping("/courses")
    public ResponseEntity<List<CourseResponseDTO>> getCoursesBySemester(@RequestParam Integer semesterNum) {
        return ResponseEntity.ok(catalogService.getCoursesBySemester(semesterNum));
    }

    @GetMapping("/tags")
    public ResponseEntity<List<TagResponseDTO>> getTags() {
        return ResponseEntity.ok(catalogService.getAllTags());
    }

    @GetMapping("/courses/search")
    public ResponseEntity<List<CourseResponseDTO>> searchCourses(@RequestParam String q) {
        return ResponseEntity.ok(catalogService.searchCourses(q));
    }

    @PostMapping("/tags")
    public ResponseEntity<TagResponseDTO> createTag(@RequestBody com.syshub.modules.catalog.entities.Tag tag) {
        return ResponseEntity.ok(catalogService.saveTag(tag));
    }

    @GetMapping("/areas")
    public ResponseEntity<List<TechnicalArea>> getAreas() {
        return ResponseEntity.ok(catalogService.getAllAreas());
    }
}