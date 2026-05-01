package com.syshub.modules.identity.dtos;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class UserAdminUpdateDTO {
    @NotBlank
    @Email
    private String email;
    @NotBlank private String username;
    @NotBlank private String nombreCompleto;
    private String registroAcademico;
    private Integer carreraId;
    @NotNull
    private Integer rolId;
    @NotNull private boolean enabled;
}