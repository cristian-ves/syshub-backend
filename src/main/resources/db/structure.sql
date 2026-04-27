-- Eliminar tablas si existen (en orden inverso por llaves foráneas)
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS carreras;
DROP TABLE IF EXISTS roles;

-- Crear tabla de Roles (Maestra)
CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL
);

-- Crear tabla de Carreras
CREATE TABLE carreras (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla de Usuarios
CREATE TABLE usuarios (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    nombre_completo VARCHAR(100) NOT NULL,
    registro_academico VARCHAR(20) UNIQUE,
    id_rol INTEGER NOT NULL,
    id_carrera INTEGER,
    enabled BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Relaciones
    CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES roles(id),
    CONSTRAINT fk_usuario_carrera FOREIGN KEY (id_carrera) REFERENCES carreras(id)
);

-- Datos iniciales necesarios para que el sistema funcione
INSERT INTO roles (nombre) VALUES 
('ROLE_ADMIN'), 
('ROLE_AUXILIAR'), 
('ROLE_ESTUDIANTE');

-- Inserts de carreras
INSERT INTO carreras (nombre) VALUES 
('Ingeniería en Ciencias y Sistemas'), 
('Ingeniería Mecánica'), 
('Ingeniería Mecánica Industrial'), 
('Ingeniería Civil'), 
('Ingeniería Industrial');