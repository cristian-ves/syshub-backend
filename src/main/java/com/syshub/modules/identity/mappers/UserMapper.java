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

    public AuthResponseDTO toAuthResponseDTO(User user, String token) {
        if (user == null) return null;

        return AuthResponseDTO.builder()
                .token(token)
                .id(user.getId())
                .username(user.getUsername())
                .email(user.getEmail())
                .nombreCompleto(user.getNombreCompleto())
                .registroAcademico(user.getRegistroAcademico())
                .role(user.getRol() != null ? user.getRol().getNombre() : null)
                .carreraId(user.getCarrera() != null ? user.getCarrera().getId() : null)
                .carreraNombre(user.getCarrera() != null ? user.getCarrera().getNombre() : null)
                .build();
    }

    public AuthResponseDTO toAuthResponseDTO(User user) {
        return toAuthResponseDTO(user, null);
    }

    public UserResponseDTO toUserResponseDTO(User user) {
        if (user == null) return null;

        return UserResponseDTO.builder()
                .id(user.getId())
                .username(user.getUsername())
                .email(user.getEmail())
                .nombreCompleto(user.getNombreCompleto())
                .registroAcademico(user.getRegistroAcademico())
                .roleId(user.getRol().getId())
                .carreraId(user.getCarrera().getId())
                .enabled(user.isEnabled())
                .build();
    }
}