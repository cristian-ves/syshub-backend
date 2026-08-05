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
    @NotBlank private String fullName;
    private String academicRecord;
    private Integer majorId;
    @NotNull
    private Integer roleId;
    @NotNull private boolean enabled;

    private String password;
}