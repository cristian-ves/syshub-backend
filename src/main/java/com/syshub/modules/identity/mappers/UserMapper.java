package com.syshub.modules.identity.mappers;

import com.syshub.modules.identity.dtos.AuthResponseDTO;
import com.syshub.modules.identity.dtos.RegisterRequestDTO;
import com.syshub.modules.identity.dtos.UserResponseDTO;
import com.syshub.modules.identity.entities.User;
import org.springframework.stereotype.Component;

@Component
public class UserMapper {

    public User toEntity(RegisterRequestDTO dto) {
        if (dto == null) return null;

        User user = new User();
        user.setUsername(dto.getUsername());
        user.setEmail(dto.getEmail());
        user.setNombreCompleto(dto.getNombreCompleto());
        user.setRegistroAcademico(dto.getRegistroAcademico());
        return user;
    }

    public UserResponseDTO toResponseDTO(User entity) {
        if (entity == null) return null;

        return new UserResponseDTO(
                entity.getId(),
                entity.getUsername(),
                entity.getEmail(),
                entity.getNombreCompleto(),
                entity.getRol() != null ? entity.getRol().getNombre() : null
        );
    }

    public AuthResponseDTO toAuthResponseDTO(User user, String token) {
        if (user == null) return null;

        return AuthResponseDTO.builder()
                .token(token)
                .username(user.getUsername())
                .role(user.getRol() != null ? user.getRol().getNombre() : null)
                .build();
    }
}