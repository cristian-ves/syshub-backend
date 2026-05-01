package com.syshub.modules.identity.controllers;

import com.syshub.modules.identity.dtos.*;
import com.syshub.modules.identity.services.IUserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
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
    public ResponseEntity<UserResponseDTO> updateAnyUser(
            @PathVariable UUID id,
            @Valid @RequestBody UserAdminUpdateDTO dto) {
        return ResponseEntity.ok(userService.updateUserByAdmin(id, dto));
    }

    @PostMapping("/admin")
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    public ResponseEntity<UserResponseDTO> createUserByAdmin(
            @Valid @RequestBody UserAdminCreateDTO dto) {
        System.out.println("llega");
        return new ResponseEntity<>(userService.createUserByAdmin(dto), HttpStatus.CREATED);
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @DeleteMapping("/admin/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable UUID id) {
        userService.deleteUser(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/admin")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ResponseEntity<Page<UserResponseDTO>> getAllUsers(
            @PageableDefault(size = 10, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable) {
        return ResponseEntity.ok(userService.findAllUsers(pageable));
    }
}