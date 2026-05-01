package com.syshub.modules.articles.mappers;

import com.syshub.modules.articles.dtos.ArticleResponseDTO;
import com.syshub.modules.articles.entities.Article;
import com.syshub.modules.catalog.dtos.CourseResponseDTO;
import com.syshub.modules.catalog.dtos.TagResponseDTO;
import com.syshub.modules.identity.dtos.UserResponseDTO;
import org.springframework.stereotype.Component;
import java.util.stream.Collectors;

@Component
public class ArticleMapper {

    public ArticleResponseDTO toDto(Article article) {
        if (article == null) return null;

        ArticleResponseDTO dto = new ArticleResponseDTO();
        dto.setId(article.getId());
        dto.setTitulo(article.getTitulo());
        dto.setSlug(article.getSlug());
        dto.setExtracto(article.getExtracto());
        dto.setContenido(article.getContenido());
        dto.setStatus(article.getStatus().name());
        dto.setCreatedAt(article.getCreatedAt());

        if (article.getAutor() != null) {
            UserResponseDTO userDto = new UserResponseDTO();
            userDto.setId(article.getAutor().getId());
            userDto.setUsername(article.getAutor().getUsername());
            userDto.setNombreCompleto(article.getAutor().getNombreCompleto());
            userDto.setRoleId(article.getAutor().getRol().getId());
            dto.setAutor(userDto);
        }

        if (article.getCurso() != null) {
            CourseResponseDTO courseDto = new CourseResponseDTO();
            courseDto.setId(article.getCurso().getId());
            courseDto.setNombre(article.getCurso().getNombre());
            courseDto.setCodigo(article.getCurso().getCodigo());
            dto.setCurso(courseDto);
        }

        dto.setTags(article.getTags().stream()
                .map(tag -> {
                    TagResponseDTO tagDto = new TagResponseDTO();
                    tagDto.setId(tag.getId());
                    tagDto.setNombre(tag.getNombre());
                    tagDto.setColor(tag.getColor());
                    return tagDto;
                })
                .collect(Collectors.toSet()));

        dto.setPuntos(0);

        return dto;
    }
}