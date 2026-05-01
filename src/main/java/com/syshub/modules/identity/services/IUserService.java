package com.syshub.modules.identity.services;

import com.syshub.modules.identity.dtos.*;
import java.util.UUID;

public interface IUserService {
    AuthResponseDTO updateOwnProfile(UUID id, UserProfileUpdateDTO dto);
    AuthResponseDTO updateUserByAdmin(UUID id, UserAdminUpdateDTO dto);
}