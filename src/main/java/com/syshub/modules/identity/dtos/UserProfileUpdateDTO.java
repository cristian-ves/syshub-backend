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
    @NotBlank private String fullName;
    private String academicRecord;
    private Integer majorId;
    @Size(min = 8) private String password;
}