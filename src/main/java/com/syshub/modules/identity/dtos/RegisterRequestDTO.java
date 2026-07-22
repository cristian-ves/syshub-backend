package com.syshub.modules.identity.dtos;

import jakarta.validation.constraints.*;
import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RegisterRequestDTO {

    @NotBlank(message = "The username is required")
    @Size(min = 4, max = 50, message = "Username must contain between 4 and 50 characters")
    private String username;

    @NotBlank(message = "The email is required")
    @Email(message = "The email is invalid")
    @Size(max = 100, message = "The email must contain less than 100 characters")
    private String email;

    @NotBlank(message = "The password is required")
    @Size(min = 8, message = "Password must contain at least 8 characters")
    private String password;

    @NotBlank(message = "The full name is required")
    @Size(max = 100, message = "The full name must not exceed 100 characters")
    private String fullName;

    @Size(max = 20, message = "The academic record can not exceed 20 characters")
    private String academicRecord;

    @NotNull(message = "The major is required")
    private Integer majorId;
}