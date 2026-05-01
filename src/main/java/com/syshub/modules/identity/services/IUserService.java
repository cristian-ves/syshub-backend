package com.syshub.modules.identity.services;

import com.syshub.modules.identity.controllers.UserAdminCreateDTO;
import com.syshub.modules.identity.dtos.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.UUID;

public interface IUserService {
    AuthResponseDTO updateOwnProfile(UUID id, UserProfileUpdateDTO dto);
    AuthResponseDTO updateUserByAdmin(UUID id, UserAdminUpdateDTO dto);
    AuthResponseDTO createUserByAdmin(UserAdminCreateDTO dto);
    void deleteUser(UUID id);
    Page<AuthResponseDTO> findAllUsers(Pageable pageable);
}