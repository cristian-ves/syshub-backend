package com.syshub.modules.identity.services.impl;

import com.syshub.modules.identity.dtos.AuthRequestDTO;
import com.syshub.modules.identity.dtos.UserResponseDTO;
import com.syshub.modules.identity.entities.User;
import com.syshub.modules.identity.repositories.UserRepository;
import com.syshub.modules.identity.services.IAuthService;
import lombok.*;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AuthServiceImpl implements IAuthService {

    private final UserRepository userRepository;

    @Override
    public UserResponseDTO login(AuthRequestDTO request) {
        // TODO: Bycript validation
        return null;
    }

    @Override
    public UserResponseDTO register(User user) {
        // TODO: register
        return null;
    }

    @Override
    public UserResponseDTO getProfile(UUID id) {
        return null;
    }
}