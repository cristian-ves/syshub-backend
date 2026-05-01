package com.syshub.modules.identity.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserResponseDTO {
    private UUID id;
    private String username;
    private String email;
    private String nombreCompleto;
    private String registroAcademico;
    private Integer roleId;
    private Integer carreraId;
    private boolean enabled;
}