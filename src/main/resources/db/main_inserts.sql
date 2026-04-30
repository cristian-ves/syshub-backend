-- Datos iniciales necesarios para que el sistema funcione
INSERT INTO roles (nombre) VALUES 
('ROLE_ADMIN'), 
('ROLE_AUXILIAR'), 
('ROLE_ESTUDIANTE');
select * from roles;

-- Inserts de carreras
INSERT INTO carreras (nombre) VALUES 
('Ingeniería en Ciencias y Sistemas'), 
('Ingeniería Mecánica'), 
('Ingeniería Mecánica Industrial'), 
('Ingeniería Civil'), 
('Ingeniería Industrial');

INSERT INTO areas_tecnicas (nombre, descripcion, color) VALUES 
('Desarrollo de Software', 'Cursos enfocados en construcción de aplicaciones, patrones y lenguajes.', '#10b981'), -- Esmeralda
('Ciencias de la Computación', 'Bases teóricas, algoritmos, estructuras de datos y lógica.', '#3b82f6'), -- Azul
('Sistemas de Información', 'Gestión de datos, análisis de sistemas y flujos de información.', '#f59e0b'), -- Ambar
('Infraestructura y Redes', 'Hardware, sistemas operativos, redes y comunicaciones.', '#6366f1'), -- Indigo
('Inteligencia Artificial', 'Modelado de datos, machine learning y sistemas expertos.', '#8b5cf6'), -- Violeta
('Gestión y Gerencia', 'Administración de proyectos, ética y liderazgo en ingeniería.', '#f43f5e'), -- Rosado
('Ciencias Básicas y Mate', 'Fundamentos de física y matemática aplicados a la ingeniería.', '#64748b'); -- Gris Pizarra

-- Insertar los Pensums para la carrera de Sistemas
INSERT INTO pensums (nombre, id_carrera) 
VALUES ('Pensum 2016', (SELECT id FROM carreras WHERE nombre = 'Ingeniería en Ciencias y Sistemas' LIMIT 1));

INSERT INTO pensums (nombre, id_carrera) 
VALUES ('Pensum 2025', (SELECT id FROM carreras WHERE nombre = 'Ingeniería en Ciencias y Sistemas' LIMIT 1));

-- Insertar los 10 semestres para el Pensum 2016
INSERT INTO semestres (numero, id_pensum)
SELECT s, p.id 
FROM generate_series(1, 10) s
JOIN pensums p ON p.nombre = 'Pensum 2016'
WHERE p.id_carrera = (SELECT id FROM carreras WHERE nombre = 'Ingeniería en Ciencias y Sistemas' LIMIT 1);

-- Insertar los 10 semestres para el Pensum 2025
INSERT INTO semestres (numero, id_pensum)
SELECT s, p.id 
FROM generate_series(1, 10) s
JOIN pensums p ON p.nombre = 'Pensum 2025'
WHERE p.id_carrera = (SELECT id FROM carreras WHERE nombre = 'Ingeniería en Ciencias y Sistemas' LIMIT 1);


-- Insertar usuarios
INSERT INTO usuarios (username, email, password, nombre_completo, registro_academico, id_rol, id_carrera)
VALUES ('admin', 'alejandrovasquezesc@gmail.com', '$2a$10$0MQnbK1b.hliG9iFESB47eMJTdKUjrjj.kDu1D0KNV3Rjd5yjs1BC', 'Thom Yorke', '202131936', 1, 1),
('auxi', 'cristianvasquez202131936', '$2a$10$0MQnbK1b.hliG9iFESB47eMJTdKUjrjj.kDu1D0KNV3Rjd5yjs1BC', 'Chris Cornell', '202012345a', 2, 1),
('student', 'syshubapp@gmail.com', '$2a$10$0MQnbK1b.hliG9iFESB47eMJTdKUjrjj.kDu1D0KNV3Rjd5yjs1BC', 'Chino Moreno', '202054321', 3, 1);

