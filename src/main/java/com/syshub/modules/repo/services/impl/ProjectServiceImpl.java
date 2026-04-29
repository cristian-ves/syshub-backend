package com.syshub.modules.repo.services.impl;

import com.syshub.core.exceptions.AppException;
import com.syshub.core.storage.IStorageService;
import com.syshub.modules.catalog.entities.Course;
import com.syshub.modules.catalog.entities.Tag;
import com.syshub.modules.catalog.repositories.CourseRepository;
import com.syshub.modules.catalog.repositories.TagRepository;
import com.syshub.modules.identity.entities.User;
import com.syshub.modules.identity.repositories.UserRepository;
import com.syshub.modules.repo.dtos.ProjectRequestDTO;
import com.syshub.modules.repo.dtos.ProjectResponseDTO;
import com.syshub.modules.repo.entities.Attachment;
import com.syshub.modules.repo.entities.Project;
import com.syshub.modules.repo.mappers.ProjectMapper;
import com.syshub.modules.repo.repositories.ProjectRepository;
import com.syshub.modules.repo.services.IProjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ProjectServiceImpl implements IProjectService {

    private final ProjectRepository projectRepository;
    private final CourseRepository courseRepository;
    private final TagRepository tagRepository;
    private final IStorageService storageService;
    private final UserRepository userRepository;
    private final ProjectMapper projectMapper;

    @Override
    @Transactional
    public ProjectResponseDTO createProject(ProjectRequestDTO request, List<MultipartFile> files) {
        // Get authenticated user
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User author = userRepository.findByUsername(username)
                .orElseThrow(() -> new AppException("Usuario no encontrado", HttpStatus.NOT_FOUND));

        // Get course
        Course course = courseRepository.findById(request.getCourseId())
                .orElseThrow(() -> new AppException("Curso no encontrado", HttpStatus.NOT_FOUND));

        // Tags handler
        Set<Tag> projectTags = request.getTags().stream()
                .map(tagName -> tagRepository.findByNombreIgnoreCase(tagName)
                        .orElseGet(() -> {
                            Tag newTag = new Tag();
                            newTag.setNombre(tagName);
                            return tagRepository.save(newTag);
                        }))
                .collect(Collectors.toSet());

        // Create project
        Project project = Project.builder()
                .titulo(request.getTitulo())
                .descripcion(request.getDescripcion())
                .repoUrl(request.getRepoUrl())
                .autor(author)
                .curso(course)
                .tags(projectTags)
                .archivos(new ArrayList<>())
                .build();

        // File processing
        if (files != null && !files.isEmpty()) {
            for (MultipartFile file : files) {
                String storedName = storageService.store(file);

                String contentType = file.getContentType();

                if (contentType == null || contentType.equals("multipart/form-data")) {
                    contentType = java.net.URLConnection.guessContentTypeFromName(file.getOriginalFilename());
                }

                if (contentType == null) {
                    contentType = "application/octet-stream";
                }

                Attachment attachment = Attachment.builder()
                        .nombreOriginal(file.getOriginalFilename())
                        .nombreArchivo(storedName)
                        .tipoArchivo(contentType)
                        .proyecto(project)
                        .build();
                project.getArchivos().add(attachment);
            }
        }

        Project savedProject = projectRepository.save(project);
        return projectMapper.toDto(savedProject);
    }

    @Override
    @Transactional(readOnly = true)
    public List<ProjectResponseDTO> getAllProjects() {
        return projectRepository.findAll().stream()
                .map(projectMapper::toDto)
                .collect(Collectors.toList());
    }

    @Override
    @Transactional(readOnly = true)
    public List<ProjectResponseDTO> getProjectsByCourse(Long courseId) {
        return projectRepository.findByCursoId(courseId).stream()
                .map(projectMapper::toDto)
                .collect(Collectors.toList());
    }

    @Override
    @Transactional(readOnly = true)
    public ProjectResponseDTO getProjectById(Long id) {
        Project project = projectRepository.findById(id)
                .orElseThrow(() -> new AppException("Proyecto no encontrado", HttpStatus.NOT_FOUND));
        return projectMapper.toDto(project);
    }

    @Override
    @Transactional(readOnly = true)
    public Resource downloadFile(String filename) {
        return storageService.loadAsResource(filename);
    }
}