package com.syshub.modules.identity.controllers;

import com.syshub.modules.identity.dtos.*;
import com.syshub.modules.identity.services.IUserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/v1/users")
@RequiredArgsConstructor
public class UserController {

    private final IUserService userService;

    @PutMapping("/me/{id}")
    public ResponseEntity<AuthResponseDTO> updateMyProfile(
            @PathVariable UUID id,
            @Valid @RequestBody UserProfileUpdateDTO dto) {
        return ResponseEntity.ok(userService.updateOwnProfile(id, dto));
    }

    @PutMapping("/admin/{id}")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ResponseEntity<AuthResponseDTO> updateAnyUser(
            @PathVariable UUID id,
            @Valid @RequestBody UserAdminUpdateDTO dto) {
        return ResponseEntity.ok(userService.updateUserByAdmin(id, dto));
    }
}