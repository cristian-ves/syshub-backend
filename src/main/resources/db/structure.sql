
-- Eliminar tablas si existen (en orden inverso por llaves foráneas)

DROP TABLE IF EXISTS proyecto_tags;
DROP TABLE IF EXISTS archivos_adjuntos;

DROP TABLE IF EXISTS proyectos;

DROP TABLE IF EXISTS prerrequisitos;
DROP TABLE IF EXISTS usuarios;

DROP TABLE IF EXISTS cursos;

DROP TABLE IF EXISTS semestres;

DROP TABLE IF EXISTS pensums;
DROP TABLE IF EXISTS areas_tecnicas;
DROP TABLE IF EXISTS tags;

DROP TABLE IF EXISTS carreras;
DROP TABLE IF EXISTS roles;

-- Crear tabla de Roles 
CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL
);

-- Crear tabla de Carreras
CREATE TABLE carreras (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE pensums (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    id_carrera INTEGER NOT NULL,
    CONSTRAINT fk_pensum_carrera FOREIGN KEY (id_carrera) REFERENCES carreras(id)
);


CREATE TABLE semestres (
    id SERIAL PRIMARY KEY,
    numero INTEGER NOT NULL,
    id_pensum INTEGER NOT NULL,
    CONSTRAINT fk_semestre_pensum FOREIGN KEY (id_pensum) REFERENCES pensums(id)
);

CREATE TABLE areas_tecnicas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    descripcion TEXT,
	color VARCHAR(7) DEFAULT '#64748b'
);

CREATE TABLE cursos (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL,
	creditos INTEGER NOT NULL DEFAULT 0,
    nombre VARCHAR(150) NOT NULL,
    id_semestre INTEGER NOT NULL,
    id_area INTEGER NOT NULL,
	obligatorio BOOLEAN NOT NULL,
    CONSTRAINT fk_curso_semestre FOREIGN KEY (id_semestre) REFERENCES semestres(id),
    CONSTRAINT fk_curso_area FOREIGN KEY (id_area) REFERENCES areas_tecnicas(id)
);

CREATE TABLE prerrequisitos (
    id SERIAL PRIMARY KEY,
    id_curso INTEGER NOT NULL,
    tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('CURSO', 'CREDITOS')),
    id_curso_prereq INTEGER,
    creditos_minimos INTEGER,
    
    CONSTRAINT fk_prereq_curso FOREIGN KEY (id_curso) REFERENCES cursos(id),
    CONSTRAINT fk_prereq_curso_prereq FOREIGN KEY (id_curso_prereq) REFERENCES cursos(id),
    
    CONSTRAINT check_prereq_type CHECK (
        (tipo = 'CURSO' AND id_curso_prereq IS NOT NULL AND creditos_minimos IS NULL) OR
        (tipo = 'CREDITOS' AND creditos_minimos IS NOT NULL AND id_curso_prereq IS NULL)
    )
);

CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL,
	color VARCHAR(7) DEFAULT '#3b82f6'
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

CREATE TABLE proyectos (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    repo_url VARCHAR(255),
    destacado BOOLEAN DEFAULT FALSE,
    fecha_subida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id UUID NOT NULL,
    course_id INTEGER NOT NULL,

	CONSTRAINT fk_proyectos_usuario FOREIGN KEY (user_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_proyectos_curso FOREIGN KEY (course_id) REFERENCES cursos(id)
);

CREATE TABLE archivos_adjuntos (
    id SERIAL PRIMARY KEY,
    nombre_original VARCHAR(255) NOT NULL,
    nombre_archivo VARCHAR(255) NOT NULL,
    tipo_archivo VARCHAR(100),
    proyecto_id INTEGER NOT NULL,

	CONSTRAINT fk_archivos_proyecto FOREIGN KEY (proyecto_id) REFERENCES proyectos(id) ON DELETE CASCADE
);

CREATE TABLE proyecto_tags (
    proyecto_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    PRIMARY KEY (proyecto_id, tag_id),

	CONSTRAINT fk_tags_proyecto FOREIGN KEY (proyecto_id) REFERENCES proyectos(id) ON DELETE CASCADE,
	CONSTRAINT fk_tags_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);
