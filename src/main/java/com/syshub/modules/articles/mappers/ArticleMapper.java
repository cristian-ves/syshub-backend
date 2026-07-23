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
        dto.setTitle(article.getTitle());
        dto.setSlug(article.getSlug());
        dto.setExcerpt(article.getSlug());
        dto.setContent(article.getContent());
        dto.setStatus(article.getStatus().name());
        dto.setCreatedAt(article.getCreatedAt());

        if (article.getAuthor() != null) {
            UserResponseDTO userDto = new UserResponseDTO();
            userDto.setId(article.getAuthor().getId());
            userDto.setUsername(article.getAuthor().getUsername());
            userDto.setFullName(article.getAuthor().getFullName());
            userDto.setRoleId(article.getAuthor().getRole().getId());
            userDto.setEnabled(article.getAuthor().isEnabled());
            dto.setAuthor(userDto);
        }

        if (article.getCourse() != null) {
            CourseResponseDTO courseDto = new CourseResponseDTO();
            courseDto.setId(article.getCourse().getId());
            courseDto.setName(article.getCourse().getName());
            courseDto.setCode(article.getCourse().getCode());
            dto.setCourse(courseDto);
        }

        dto.setTags(article.getTags().stream()
                .map(tag -> {
                    TagResponseDTO tagDto = new TagResponseDTO();
                    tagDto.setId(tag.getId());
                    tagDto.setName(tag.getName());
                    tagDto.setColor(tag.getColor());
                    return tagDto;
                })
                .collect(Collectors.toSet()));

        dto.setPoints(article.getPoints() != null ? article.getPoints() : 0);

        if (currentUserId != null && article.getFavorites() != null) {
            boolean isFav = article.getFavorites().stream()
                    .anyMatch(f -> f.getUser().getId().equals(currentUserId));
            dto.setFavorite(isFav);
        } else {
            dto.setFavorite(false);
        }

        if (currentUserId != null && article.getVotes() != null) {
            Integer userVote = article.getVotes().stream()
                    .filter(v -> v.getUser().getId().equals(currentUserId))
                    .filter(v -> "ARTICLE".equals(v.getTargetType()))
                    .map(ArticleVote::getValue)
                    .findFirst()
                    .orElse(0);
            dto.setVotes(userVote);
        } else {
            dto.setVotes(0);
        }

        return dto;
    }
}