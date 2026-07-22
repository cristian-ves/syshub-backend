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
    private String fullName;
    private String academicRecord;
    private Integer majorId;
    private String majorName;
}