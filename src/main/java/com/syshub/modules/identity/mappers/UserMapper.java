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
        user.setFullName(dto.getFullName());
        user.setAcademicRecord(dto.getAcademicRecord());
        return user;
    }

    public AuthResponseDTO toAuthResponseDTO(User user, String token) {
        if (user == null) return null;

        return AuthResponseDTO.builder()
                .token(token)
                .id(user.getId())
                .username(user.getUsername())
                .email(user.getEmail())
                .fullName(user.getFullName())
                .academicRecord(user.getAcademicRecord())
                .role(user.getRole() != null ? user.getRole().getName() : null)
                .majorId(user.getMajor() != null ? user.getMajor().getId() : null)
                .majorName(user.getMajor() != null ? user.getMajor().getName() : null)
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
                .fullName(user.getFullName())
                .academicRecord(user.getAcademicRecord())
                .roleId(user.getRole().getId())
                .majorId(user.getMajor().getId())
                .enabled(user.isEnabled())
                .build();
    }
}