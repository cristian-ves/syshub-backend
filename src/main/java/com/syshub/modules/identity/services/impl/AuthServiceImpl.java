package com.syshub.modules.identity.services.impl;

import com.syshub.core.exceptions.AppException;
import com.syshub.core.security.JwtService;
import com.syshub.core.services.EmailService;
import com.syshub.modules.identity.dtos.AuthRequestDTO;
import com.syshub.modules.identity.dtos.AuthResponseDTO;
import com.syshub.modules.identity.dtos.RegisterRequestDTO;
import com.syshub.modules.identity.entities.Carrera;
import com.syshub.modules.identity.entities.Role;
import com.syshub.modules.identity.entities.User;
import com.syshub.modules.identity.mappers.UserMapper;
import com.syshub.modules.identity.repositories.CarreraRepository;
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

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AuthServiceImpl implements IAuthService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final CarreraRepository carreraRepository;
    private final PasswordEncoder passwordEncoder;

    private final UserMapper userMapper;
    private final AuthenticationManager authenticationManager;
    private final JwtService jwtService;
    private final EmailService emailService;

    @Override
    public AuthResponseDTO validateAndRefresh(String username) {
        var user = userRepository.findByUsername(username)
                .orElseThrow(() -> new AppException("Usuario no encontrado", HttpStatus.NOT_FOUND));

        return AuthResponseDTO.builder()
                .token(jwtService.generateAccessToken(user))
                .username(user.getUsername())
                .role(user.getRol().getNombre())
                .build();
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
            throw new BadCredentialsException("Usuario o contraseña incorrectos");
        }

        var user = userRepository.findByUsername(request.getUsername())
                .orElseThrow(() -> new AppException("El usuario no existe", HttpStatus.NOT_FOUND));


        String jwtToken = jwtService.generateAccessToken(user);

        return userMapper.toAuthResponseDTO(user, jwtToken);
    }

    @Override
    public AuthResponseDTO register(RegisterRequestDTO request) {

        // Validar si el usuario ya existe antes de procesar todo
        if (userRepository.existsByUsername(request.getUsername())) {
            throw new AppException("El nombre de usuario ya está en uso", HttpStatus.CONFLICT);
        }

        if (userRepository.existsByEmail(request.getEmail())) {
            throw new AppException("El correo electrónico ya está registrado", HttpStatus.CONFLICT);
        }

        if (userRepository.existsByRegistroAcademico(request.getRegistroAcademico())) {
            throw new AppException("El número de carné ya está registrado", HttpStatus.CONFLICT);
        }

        Role userRole = roleRepository.findByNombre("ROLE_ESTUDIANTE")
                .orElseThrow(() -> new AppException("Error: El rol 'ROLE_ESTUDIANTE' no existe en la base de datos.", HttpStatus.INTERNAL_SERVER_ERROR));

        Carrera carrera = carreraRepository.findById(request.getIdCarrera())
                .orElseThrow(() -> new AppException("La carrera seleccionada no es válida o no existe.", HttpStatus.NOT_FOUND));

        User user = userMapper.toEntity(request);

        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setRol(userRole);
        user.setCarrera(carrera);
        user.setEnabled(true);

        userRepository.save(user);
        String token = jwtService.generateAccessToken(user);

        return userMapper.toAuthResponseDTO(user, token);
    }

    @Override
    public void forgotPassword(String email) {
        var user = userRepository.findByEmail(email)
                .orElseThrow(() -> new AppException("No existe un usuario con ese correo", HttpStatus.NOT_FOUND));

        String resetToken = jwtService.generateResetToken(user);

        emailService.sendPasswordResetEmail(user.getEmail(), user.getUsername(), resetToken);
    }


    @Override
    public void resetPassword(String token, String newPassword) {
        String username = jwtService.extractUsername(token);

        var user = userRepository.findByUsername(username)
                .orElseThrow(() -> new AppException("El usuario asociado al token no existe.", HttpStatus.NOT_FOUND));

        user.setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(user);
    }

}