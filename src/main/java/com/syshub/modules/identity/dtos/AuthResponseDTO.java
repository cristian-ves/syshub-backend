package com.syshub.modules.identity.dtos;

import lombok.*;
import java.util.UUID;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AuthResponseDTO {
    private String token;
    private UUID id;
    private String username;
    private String email;
    private String role;
    private String nombreCompleto;
    private String registroAcademico;
    private Integer carreraId;
    private String carreraNombre;
}