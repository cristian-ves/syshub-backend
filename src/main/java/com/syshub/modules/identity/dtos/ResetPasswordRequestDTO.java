package com.syshub.modules.identity.dtos;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class ResetPasswordRequestDTO {

    @NotBlank(message = "The token is required")
    private String token;

    @NotBlank(message = "The new password is required")
    @Size(min = 8, message = "The new password must contain at least 8 characters")
    private String password;
}