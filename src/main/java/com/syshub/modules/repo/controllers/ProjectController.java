package com.syshub.modules.repo.controllers;

import com.syshub.modules.repo.dtos.ProjectRequestDTO;
import com.syshub.modules.repo.dtos.ProjectResponseDTO;
import com.syshub.modules.repo.services.IProjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/api/v1/projects")
@RequiredArgsConstructor
public class ProjectController {

    private final IProjectService projectService;

    @PostMapping(consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<ProjectResponseDTO> createProject(
            @RequestPart("project") ProjectRequestDTO request,
            @RequestPart(value = "files", required = false) List<MultipartFile> files
    ) {
        // Method to handle project creation with optional file attachments
        return new ResponseEntity<>(projectService.createProject(request, files), HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<ProjectResponseDTO>> getAllProjects() {
        // Method to retrieve all available projects
        return ResponseEntity.ok(projectService.getAllProjects());
    }

    @GetMapping("/course/{courseId}")
    public ResponseEntity<List<ProjectResponseDTO>> getByCourse(@PathVariable Long courseId) {
        // Method to filter projects by a specific course ID
        return ResponseEntity.ok(projectService.getProjectsByCourse(courseId));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProjectResponseDTO> getById(@PathVariable Long id) {
        // Method to fetch a single project by its unique ID
        return ResponseEntity.ok(projectService.getProjectById(id));
    }

    @GetMapping("/files/{filename:.+}")
    public ResponseEntity<Resource> getFile(@PathVariable String filename) {
        // Method to serve files as downloadable resources
        Resource file = projectService.downloadFile(filename);

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getFilename() + "\"")
                .body(file);
    }
}