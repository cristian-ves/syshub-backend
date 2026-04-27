package com.syshub.modules.identity.services.impl;

import com.syshub.core.security.JwtService;
import com.syshub.modules.identity.dtos.AuthRequestDTO;
import com.syshub.modules.identity.dtos.AuthResponseDTO;
import com.syshub.modules.identity.dtos.RegisterRequestDTO;
import com.syshub.modules.identity.dtos.UserResponseDTO;
import com.syshub.modules.identity.entities.Carrera;
import com.syshub.modules.identity.entities.Role;
import com.syshub.modules.identity.entities.User;
import com.syshub.modules.identity.mappers.UserMapper;
import com.syshub.modules.identity.repositories.CarreraRepository;
import com.syshub.modules.identity.repositories.RoleRepository;
import com.syshub.modules.identity.repositories.UserRepository;
import com.syshub.modules.identity.services.IAuthService;
import lombok.*;
import org.springframework.security.authentication.AuthenticationManager;
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

    @Override
    public AuthResponseDTO login(AuthRequestDTO request) {

        try{

        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getUsername(),
                        request.getPassword()
                )
        );
        }catch(Exception e) {
            System.out.println("Error de auth: " + e.getMessage());
        }

        var user = userRepository.findByUsername(request.getUsername())
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

        System.out.println(user);

        String jwtToken = jwtService.generateToken(user);

        AuthResponseDTO authResponseDTO = userMapper.toAuthResponseDTO(user, jwtToken);
        System.out.println(authResponseDTO.toString());

        return authResponseDTO;
    }

    @Override
    public AuthResponseDTO register(RegisterRequestDTO request) {
        Role userRole = roleRepository.findByNombre("ROLE_ESTUDIANTE")
                .orElseThrow(() -> new RuntimeException("Error: Rol no encontrado."));
        Carrera carrera = carreraRepository.findById(request.getIdCarrera())
                .orElseThrow(() -> new RuntimeException("Error: Carrera no encontrada."));

        User user = userMapper.toEntity(request);

        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setRol(userRole);
        user.setCarrera(carrera);
        user.setEnabled(true);

        userRepository.save(user);

        String token = jwtService.generateToken(user);

        return userMapper.toAuthResponseDTO(user, token);
    }

}