package com.syshub.modules.identity.services.impl;

import com.syshub.core.exceptions.AppException;
import com.syshub.core.security.JwtService;
import com.syshub.core.services.EmailService;
import com.syshub.modules.identity.dtos.AuthRequestDTO;
import com.syshub.modules.identity.dtos.AuthResponseDTO;
import com.syshub.modules.identity.dtos.RegisterRequestDTO;
import com.syshub.modules.identity.entities.Major;
import com.syshub.modules.identity.entities.Role;
import com.syshub.modules.identity.entities.User;
import com.syshub.modules.identity.mappers.UserMapper;
import com.syshub.modules.identity.repositories.MajorRepository;
import com.syshub.modules.identity.repositories.RoleRepository;
import com.syshub.modules.identity.repositories.UserRepository;
import com.syshub.modules.identity.services.IAuthService;
import lombok.*;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthServiceImpl implements IAuthService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final MajorRepository majorRepository;
    private final PasswordEncoder passwordEncoder;

    private final UserMapper userMapper;
    private final AuthenticationManager authenticationManager;
    private final JwtService jwtService;
    private final EmailService emailService;

    @Override
    public AuthResponseDTO validateAndRefresh(String username) {
        var user = userRepository.findByUsername(username)
                .orElseThrow(() -> new AppException("User not found", HttpStatus.NOT_FOUND));

        String token = jwtService.generateAccessToken(user);

        return userMapper.toAuthResponseDTO(user, token);
    }

    @Override
    public AuthResponseDTO login(AuthRequestDTO request) {

        try {
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(
                            request.getUsername(),
                            request.getPassword()
                    )
            );
        } catch (BadCredentialsException e) {
            throw new BadCredentialsException("Username or password is incorrect");
        }

        var user = userRepository.findByUsername(request.getUsername())
                .orElseThrow(() -> new AppException("The username doesn't exist", HttpStatus.NOT_FOUND));


        String jwtToken = jwtService.generateAccessToken(user);

        return userMapper.toAuthResponseDTO(user, jwtToken);
    }

    @Override
    public AuthResponseDTO register(RegisterRequestDTO request) {

        // Validate if user exists before adding it
        if (userRepository.existsByUsername(request.getUsername())) {
            throw new AppException("The username is already taken", HttpStatus.CONFLICT);
        }

        if (userRepository.existsByEmail(request.getEmail())) {
            throw new AppException("The email is already taken", HttpStatus.CONFLICT);
        }

        if (userRepository.existsByAcademicRecord(request.getAcademicRecord())) {
            throw new AppException("The academic record is already taken", HttpStatus.CONFLICT);
        }

        Role userRole = roleRepository.findRoleByName("ROLE_STUDENT")
                .orElseThrow(() -> new AppException("Error: The role 'ROLE_STUDENT' doesn't exist in the data base.", HttpStatus.INTERNAL_SERVER_ERROR));

        Major major = majorRepository.findById(request.getMajorId())
                .orElseThrow(() -> new AppException("The selected major is not valid or doesn't exist.", HttpStatus.NOT_FOUND));

        User user = userMapper.toEntity(request);

        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setRole(userRole);
        user.setMajor(major);
        user.setEnabled(true);

        userRepository.save(user);
        String token = jwtService.generateAccessToken(user);

        return userMapper.toAuthResponseDTO(user, token);
    }

    @Override
    public void forgotPassword(String email) {
        var user = userRepository.findByEmail(email)
                .orElseThrow(() -> new AppException("There's no user with that email", HttpStatus.NOT_FOUND));

        String resetToken = jwtService.generateResetToken(user);

        emailService.sendPasswordResetEmail(user.getEmail(), user.getUsername(), resetToken);
    }


    @Override
    public void resetPassword(String token, String newPassword) {
        String username = jwtService.extractUsername(token);

        var user = userRepository.findByUsername(username)
                .orElseThrow(() -> new AppException("The user associated to the token doesn't exist.", HttpStatus.NOT_FOUND));

        user.setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(user);
    }

}