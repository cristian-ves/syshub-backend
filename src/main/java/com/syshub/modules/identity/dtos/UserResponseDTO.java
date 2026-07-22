package com.syshub.modules.identity.dtos;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class UserResponseDTO {
    private UUID id;
    private String username;
    private String email;
    private String fullName;
    private String academicRecord;
    private Integer roleId;
    private Integer majorId;
    private boolean enabled;
}