package com.syshub.modules.identity.dtos;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class UserProfileUpdateDTO {
    @NotBlank
    @Email
    private String email;
    @NotBlank private String username;
    @NotBlank private String nombreCompleto;
    private String registroAcademico;
    private Integer carreraId;
    @Size(min = 8) private String password;
}