package com.syshub.modules.articles.mappers;

import com.syshub.modules.articles.dtos.ArticleResponseDTO;
import com.syshub.modules.articles.entities.Article;
import com.syshub.modules.articles.entities.ArticleVote;
import com.syshub.modules.catalog.dtos.CourseResponseDTO;
import com.syshub.modules.catalog.dtos.TagResponseDTO;
import com.syshub.modules.identity.dtos.UserResponseDTO;
import org.springframework.stereotype.Component;

import java.util.UUID;
import java.util.stream.Collectors;

@Component
public class ArticleMapper {

    public ArticleResponseDTO toDto(Article article, UUID currentUserId) {
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
            userDto.setEnabled(article.getAutor().isEnabled());
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

        dto.setPuntos(article.getPuntos() != null ? article.getPuntos() : 0);

        if (currentUserId != null && article.getFavoritos() != null) {
            boolean isFav = article.getFavoritos().stream()
                    .anyMatch(f -> f.getUsuario().getId().equals(currentUserId));
            dto.setFavorite(isFav);
        } else {
            dto.setFavorite(false);
        }

        if (currentUserId != null && article.getVotos() != null) {
            Integer userVote = article.getVotos().stream()
                    .filter(v -> v.getUsuario().getId().equals(currentUserId))
                    .filter(v -> "ARTICULO".equals(v.getTargetType()))
                    .map(ArticleVote::getValor)
                    .findFirst()
                    .orElse(0);
            dto.setVote(userVote);
        } else {
            dto.setVote(0);
        }

        return dto;
    }
}