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
    List<ProjectResponseDTO> getProjectsByCourse(Long courseId);
    ProjectResponseDTO getProjectById(Long id);
    Resource downloadFile(String filename);
    Page<ProjectResponseDTO> getProjects(String tag, Boolean destacado, Long cursoId, Integer semestreNum, UUID userId, Long pensumId, Pageable pageable);
    ProjectResponseDTO toggleFeatured(Long id, boolean featured);
}