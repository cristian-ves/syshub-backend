package com.syshub.modules.repo.mappers;

import com.syshub.modules.repo.dtos.AttachmentDTO;
import com.syshub.modules.repo.dtos.ProjectResponseDTO;
import com.syshub.modules.repo.dtos.RepositoryTagDTO;
import com.syshub.modules.repo.entities.Project;
import com.syshub.modules.catalog.entities.Tag;
import org.springframework.stereotype.Component;
import java.util.stream.Collectors;
import java.util.ArrayList;

@Component
public class ProjectMapper {

    public ProjectResponseDTO toDto(Project project) {
        if (project == null) return null;

        ProjectResponseDTO dto = new ProjectResponseDTO();
        dto.setId(project.getId());
        dto.setTitulo(project.getTitulo());
        dto.setDescripcion(project.getDescripcion());
        dto.setRepoUrl(project.getRepoUrl());
        dto.setDestacado(project.isDestacado());
        dto.setAutorNombre(project.getAutor().getNombreCompleto());
        dto.setCursoNombre(project.getCurso().getNombre());
        dto.setPensumNombre(project.getCurso().getSemester().getPensum().getNombre());
        dto.setFechaSubida(project.getFechaSubida());
        dto.setAreaColor(project.getCurso().getArea().getColor());
        dto.setAreaNombre(project.getCurso().getArea().getNombre());

        dto.setTags(project.getTags().stream()
                .map(tag->{
                    RepositoryTagDTO tagDTO = new RepositoryTagDTO();
                    tagDTO.setNombre(tag.getNombre());
                    tagDTO.setColor(tag.getColor());
                    return tagDTO;
                })
                .collect(Collectors.toSet()));

        if (project.getArchivos() != null) {
            dto.setArchivos(project.getArchivos().stream()
                    .map(att -> {
                        AttachmentDTO attDto = new AttachmentDTO();
                        attDto.setId(att.getId());
                        attDto.setNombreOriginal(att.getNombreOriginal());
                        attDto.setTipoArchivo(att.getTipoArchivo());
                        attDto.setNombreArchivo(att.getNombreArchivo());
                        return attDto;
                    })
                    .collect(Collectors.toList()));
        } else {
            dto.setArchivos(new ArrayList<>());
        }

        return dto;
    }
}