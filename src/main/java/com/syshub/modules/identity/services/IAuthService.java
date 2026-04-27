package com.syshub.modules.identity.services;

import com.syshub.modules.identity.dtos.AuthRequestDTO;
import com.syshub.modules.identity.dtos.UserResponseDTO;
import com.syshub.modules.identity.entities.User;

import java.util.UUID;

public interface IAuthService {
    UserResponseDTO login(AuthRequestDTO request);
    UserResponseDTO register(User registroRequest);
    UserResponseDTO getProfile(UUID id);
}