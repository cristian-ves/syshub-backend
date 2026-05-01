package com.syshub.modules.identity.services.impl;

import com.syshub.core.exceptions.AppException;
import com.syshub.core.security.JwtService;
import com.syshub.modules.identity.dtos.*;
import com.syshub.modules.identity.entities.*;
import com.syshub.modules.identity.repositories.*;
import com.syshub.modules.identity.services.IUserService;
import com.syshub.modules.identity.mappers.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements IUserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final CarreraRepository carreraRepository;
    private final UserMapper userMapper;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;

    @Override
    @Transactional
    public AuthResponseDTO updateOwnProfile(UUID id, UserProfileUpdateDTO dto) {
        User user = userRepository.findById(id).orElseThrow(() -> new AppException("El usuario no existe", HttpStatus.NOT_FOUND));

        validateUniqueness(user, dto.getEmail(), dto.getUsername());

        user.setEmail(dto.getEmail());
        user.setUsername(dto.getUsername());
        user.setNombreCompleto(dto.getNombreCompleto());
        user.setRegistroAcademico(dto.getRegistroAcademico());

        if (dto.getCarreraId() != null) {
            user.setCarrera(carreraRepository.findById(dto.getCarreraId())
                    .orElseThrow(() -> new RuntimeException("Carrera no encontrada")));
        }

        if (dto.getPassword() != null && !dto.getPassword().isBlank()) {
            user.setPassword(passwordEncoder.encode(dto.getPassword()));
        }

        User userResult = userRepository.save(user);

        String jwtToken = jwtService.generateAccessToken(userResult);

        return userMapper.toAuthResponseDTO(userResult, jwtToken);
    }

    @Override
    @Transactional
    public AuthResponseDTO updateUserByAdmin(UUID id, UserAdminUpdateDTO dto) {
        User user = userRepository.findById(id).orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

        validateUniqueness(user, dto.getEmail(), dto.getUsername());

        user.setEmail(dto.getEmail());
        user.setUsername(dto.getUsername());
        user.setNombreCompleto(dto.getNombreCompleto());
        user.setRegistroAcademico(dto.getRegistroAcademico());
        user.setEnabled(dto.isEnabled());

        Role newRole = roleRepository.findById(dto.getRolId())
                .orElseThrow(() -> new RuntimeException("Rol no encontrado"));
        user.setRol(newRole);

        if (dto.getCarreraId() != null) {
            user.setCarrera(carreraRepository.findById(dto.getCarreraId())
                    .orElseThrow(() -> new RuntimeException("Carrera no encontrada")));
        }

        return userMapper.toAuthResponseDTO(userRepository.save(user), null);
    }

    private void validateUniqueness(User current, String newEmail, String newUsername) {
        if (!current.getEmail().equals(newEmail) && userRepository.existsByEmail(newEmail)) {
            throw new RuntimeException("Email ya está en uso");
        }
        if (!current.getUsername().equals(newUsername) && userRepository.existsByUsername(newUsername)) {
            throw new RuntimeException("Username ya está en uso");
        }
    }
}