package com.syshub.modules.identity.dtos;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserAdminCreateDTO {
    @NotBlank
    @Email
    String email;
    @NotBlank String username;
    @NotBlank String nombreCompleto;
    String registroAcademico;
    String password;
    @NotNull
    Integer rolId;
    Integer carreraId;
    boolean enabled = true;
}