package com.syshub.modules.identity.services.impl;

import com.syshub.core.exceptions.AppException;
import com.syshub.core.security.JwtService;
import com.syshub.modules.identity.dtos.UserAdminCreateDTO;
import com.syshub.modules.identity.dtos.*;
import com.syshub.modules.identity.entities.*;
import com.syshub.modules.identity.repositories.*;
import com.syshub.modules.identity.services.IUserService;
import com.syshub.modules.identity.mappers.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
    private final MajorRepository majorRepository;
    private final UserMapper userMapper;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;

    @Override
    @Transactional
    public void deleteUser(UUID id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new AppException("The user was not found", HttpStatus.NOT_FOUND));

        userRepository.delete(user);
    }

    @Override
    public Page<UserResponseDTO> findAllUsers(Pageable pageable) {
        Page<User> userPage = userRepository.findAll(pageable);

        return userPage.map(user -> userMapper.toUserResponseDTO(user));
    }

    @Override
    @Transactional
    public UserResponseDTO createUserByAdmin(UserAdminCreateDTO dto) {
        if (userRepository.existsByEmail(dto.getEmail())) {
            throw new AppException("The email is already taken", HttpStatus.CONFLICT);
        }
        if (userRepository.existsByUsername(dto.getUsername())) {
            throw new AppException("The username is already taken", HttpStatus.CONFLICT);
        }

        User user = new User();
        user.setEmail(dto.getEmail());
        user.setUsername(dto.getUsername());
        user.setFullName(dto.getFullName());
        user.setAcademicRecord(dto.getAcademicRecord());
        user.setEnabled(dto.isEnabled());
        user.setPassword(passwordEncoder.encode(dto.getPassword()));

        Role role = roleRepository.findById(dto.getRoleId())
                .orElseThrow(() -> new AppException("Role not found", HttpStatus.NOT_FOUND));
        user.setRole(role);

        if (dto.getMajorId() != null) {
            Major major = majorRepository.findById(dto.getMajorId())
                    .orElseThrow(() -> new AppException("Major not found", HttpStatus.NOT_FOUND));
            user.setMajor(major);
        }

        return userMapper.toUserResponseDTO(userRepository.save(user));
    }

    @Override
    @Transactional
    public AuthResponseDTO updateOwnProfile(UUID id, UserProfileUpdateDTO dto) {
        User user = userRepository.findById(id).orElseThrow(() -> new AppException("The user doesn't exist", HttpStatus.NOT_FOUND));

        validateUniqueness(user, dto.getEmail(), dto.getUsername());

        user.setEmail(dto.getEmail());
        user.setUsername(dto.getUsername());
        user.setFullName(dto.getFullName());
        user.setAcademicRecord(dto.getAcademicRecord());

        if (dto.getMajorId() != null) {
            user.setMajor(majorRepository.findById(dto.getMajorId())
                    .orElseThrow(() -> new RuntimeException("Major not found")));
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
    public UserResponseDTO updateUserByAdmin(UUID id, UserAdminUpdateDTO dto) {
        User user = userRepository.findById(id).orElseThrow(() -> new RuntimeException("User not found"));

        validateUniqueness(user, dto.getEmail(), dto.getUsername());

        user.setEmail(dto.getEmail());
        user.setUsername(dto.getUsername());
        user.setFullName(dto.getFullName());
        user.setAcademicRecord(dto.getAcademicRecord());
        user.setEnabled(dto.isEnabled());

        if(dto.getPassword() != null && !dto.getPassword().isBlank()) {
            user.setPassword(passwordEncoder.encode(dto.getPassword()));
        }

        Role newRole = roleRepository.findById(dto.getRoleId())
                .orElseThrow(() -> new RuntimeException("Role not found"));
        user.setRole(newRole);

        if (dto.getMajorId() != null) {
            user.setMajor(majorRepository.findById(dto.getMajorId())
                    .orElseThrow(() -> new RuntimeException("Major not found")));
        }

        return userMapper.toUserResponseDTO(userRepository.save(user));
    }

    private void validateUniqueness(User current, String newEmail, String newUsername) {
        if (!current.getEmail().equals(newEmail) && userRepository.existsByEmail(newEmail)) {
            throw new AppException("The username is already taken", HttpStatus.CONFLICT);
        }
        if (!current.getUsername().equals(newUsername) && userRepository.existsByUsername(newUsername)) {
            throw new AppException("The username is already taken", HttpStatus.CONFLICT);
        }
    }
}