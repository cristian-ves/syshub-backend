package com.syshub.modules.repo.controllers;

import com.syshub.modules.repo.dtos.ProjectRequestDTO;
import com.syshub.modules.repo.dtos.ProjectResponseDTO;
import com.syshub.modules.repo.services.IProjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.UUID;

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
    public ResponseEntity<Page<ProjectResponseDTO>> getProjects(
            @RequestParam(required = false) String tag,
            @RequestParam(required = false) Boolean featured,
            @RequestParam(required = false) String courseName,
            @RequestParam(required = false) Integer semesterNum,
            @RequestParam(required = false) UUID userId,
            @RequestParam(required = false) Integer studyPlanId,
            @RequestParam(required = false) Integer areaId,
            @RequestParam(required = false) String search,
            @PageableDefault(size = 10, sort = {"featured", "uploadDate"}, direction = Sort.Direction.DESC) Pageable pageable
    ) {
//        retrieve projects by filter
        return ResponseEntity.ok(projectService.getProjects(tag, featured, courseName, semesterNum, userId, studyPlanId, areaId, search, pageable));
    }

    @PreAuthorize("hasAnyRole('ROLE_AUXILIAR', 'ROLE_ADMIN')")
    @PatchMapping("/{id}/featured")
    public ResponseEntity<ProjectResponseDTO> updateFeatured(
            @PathVariable Integer id,
            @RequestParam Boolean featured
    ) {
        // Project to toggle the feature property of a project
        return ResponseEntity.ok(projectService.toggleFeatured(id, featured));
    }

    @GetMapping("/course/{courseId}")
    public ResponseEntity<List<ProjectResponseDTO>> getByCourse(@PathVariable Integer courseId) {
        // Method to filter projects by a specific course ID
        return ResponseEntity.ok(projectService.getProjectsByCourse(courseId));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProjectResponseDTO> getById(@PathVariable Integer id) {
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