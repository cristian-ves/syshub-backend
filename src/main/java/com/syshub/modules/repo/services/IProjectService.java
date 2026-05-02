package com.syshub.modules.repo.services;

import com.syshub.modules.repo.dtos.ProjectRequestDTO;
import com.syshub.modules.repo.dtos.ProjectResponseDTO;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.UUID;

public interface IProjectService {
    ProjectResponseDTO createProject(ProjectRequestDTO request, List<MultipartFile> files);

    List<ProjectResponseDTO> getProjectsByCourse(Integer courseId);

    ProjectResponseDTO getProjectById(Integer id);

    Resource downloadFile(String filename);

    Page<ProjectResponseDTO> getProjects(
            String tag,
            Boolean destacado,
            String cursoNombre,
            Integer semestreNum,
            UUID userId,
            Integer pensumId,
            Integer areaId,
            String search,
            Pageable pageable);

    ProjectResponseDTO toggleFeatured(Integer id, boolean featured);
}