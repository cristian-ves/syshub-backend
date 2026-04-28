package com.syshub.modules.identity.controllers;

import com.syshub.modules.identity.dtos.AuthRequestDTO;
import com.syshub.modules.identity.dtos.AuthResponseDTO;
import com.syshub.modules.identity.dtos.RegisterRequestDTO;
import com.syshub.modules.identity.dtos.UserResponseDTO;
import com.syshub.modules.identity.services.IAuthService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthController {

    private final IAuthService authService;

    @PostMapping("/register")
    public ResponseEntity<AuthResponseDTO> register(@Valid @RequestBody RegisterRequestDTO request) {
        return ResponseEntity.ok(authService.register(request));
    }

    @PostMapping("/login")
    public ResponseEntity<AuthResponseDTO> login(@Valid @RequestBody AuthRequestDTO request) {
        return ResponseEntity.ok(authService.login(request));
    }
}