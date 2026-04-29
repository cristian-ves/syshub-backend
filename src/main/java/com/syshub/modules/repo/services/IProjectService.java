package com.syshub.modules.repo.services;

import com.syshub.modules.repo.dtos.ProjectRequestDTO;
import com.syshub.modules.repo.dtos.ProjectResponseDTO;
import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;

public interface IProjectService {
    ProjectResponseDTO createProject(ProjectRequestDTO request, List<MultipartFile> files);
    List<ProjectResponseDTO> getAllProjects();
    List<ProjectResponseDTO> getProjectsByCourse(Long courseId);
    ProjectResponseDTO getProjectById(Long id);
    Resource downloadFile(String filename);
}