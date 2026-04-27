package com.syshub.modules.identity.services;

import com.syshub.modules.identity.dtos.AuthRequestDTO;
import com.syshub.modules.identity.dtos.AuthResponseDTO;
import com.syshub.modules.identity.dtos.RegisterRequestDTO;
import com.syshub.modules.identity.dtos.UserResponseDTO;

public interface IAuthService {
    AuthResponseDTO login(AuthRequestDTO request);
    AuthResponseDTO register(RegisterRequestDTO registroRequest);
}