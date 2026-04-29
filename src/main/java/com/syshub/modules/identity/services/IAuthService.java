package com.syshub.modules.identity.services;

import com.syshub.modules.identity.dtos.AuthRequestDTO;
import com.syshub.modules.identity.dtos.AuthResponseDTO;
import com.syshub.modules.identity.dtos.RegisterRequestDTO;

public interface IAuthService {
    AuthResponseDTO login(AuthRequestDTO request);
    AuthResponseDTO register(RegisterRequestDTO registroRequest);
    void forgotPassword(String email);
    void resetPassword(String token, String newPassword);
    AuthResponseDTO validateAndRefresh(String username);
}