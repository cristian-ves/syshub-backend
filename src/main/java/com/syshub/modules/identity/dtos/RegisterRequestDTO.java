package com.syshub.modules.identity.dtos;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RegisterRequestDTO {
    private String username;
    private String email;
    private String password;
    private String nombreCompleto;
    private String registroAcademico;
    private Integer idCarrera;
}