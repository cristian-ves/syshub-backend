package com.syshub.modules.identity.services;

import com.syshub.modules.identity.dtos.UserAdminCreateDTO;
import com.syshub.modules.identity.dtos.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.UUID;

public interface IUserService {
    Page<UserResponseDTO> findAllUsers(Pageable pageable);
    UserResponseDTO createUserByAdmin(UserAdminCreateDTO dto);
    UserResponseDTO updateUserByAdmin(UUID id, UserAdminUpdateDTO dto);
    AuthResponseDTO updateOwnProfile(UUID id, UserProfileUpdateDTO dto);
    void deleteUser(UUID id);
}