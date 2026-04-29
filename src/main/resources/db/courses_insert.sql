-- Insertar cursos de ingenieria en sistemas

-- SEMESTRE 1 - PENSUM 2016

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '028',
    'SOCIAL HUMANISTICA 1',
    (SELECT id FROM semestres WHERE numero = 1 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    true,
    4
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '169',
    'MATEMATICA BASICA 1',
    (SELECT id FROM semestres WHERE numero = 1 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    7
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2666',
    'ORIENTACION LIDERAZGO',
    (SELECT id FROM semestres WHERE numero = 1 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    true,
    1
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '119',
    'TECNICA COMPLEMENTARIA 1',
    (SELECT id FROM semestres WHERE numero = 1 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    3
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '177',
    'DEPORTES 1',
    (SELECT id FROM semestres WHERE numero = 1 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    1
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '216',
    'QUIMICA 1',
    (SELECT id FROM semestres WHERE numero = 1 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    3
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2792',
    'IDIOMA TECNICO 1',
    (SELECT id FROM semestres WHERE numero = 1 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    2
);

-- SEMESTRE 2 - PENSUM 2016

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '029',
    'SOCIAL HUMANISTICA 2',
    (SELECT id FROM semestres WHERE numero = 2 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    true,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '029' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '028' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '170',
    'MATEMATICA BASICA 2',
    (SELECT id FROM semestres WHERE numero = 2 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    7
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '170' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '169' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2667',
    'TECNICAS DE INVESTIGACION Y ESTUDIO',
    (SELECT id FROM semestres WHERE numero = 2 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    true,
    3
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '072',
    'FISICA BASICA',
    (SELECT id FROM semestres WHERE numero = 2 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '072' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '169' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '178',
    'DEPORTES 2',
    (SELECT id FROM semestres WHERE numero = 2 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    1
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '178' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '177' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2793',
    'IDIOMA TECNICO 2',
    (SELECT id FROM semestres WHERE numero = 2 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    2
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2793' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2792' LIMIT 1)
);

-- SEMESTRE 3 - PENSUM 2016

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2797',
    'LOGICA DE SISTEMAS',
    (SELECT id FROM semestres WHERE numero = 3 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias de la Computación' LIMIT 1),
    true,
    2
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2797' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '170' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, creditos_minimos)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2797' LIMIT 1),
    'CREDITOS',
    33
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2795',
    'MATE COMPUTO 1',
    (SELECT id FROM semestres WHERE numero = 3 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2795' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '170' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, creditos_minimos)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2795' LIMIT 1),
    'CREDITOS',
    33
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2796',
    'INTR. A LA PROG. Y COMPUTACION 1',
    (SELECT id FROM semestres WHERE numero = 3 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Desarrollo de Software' LIMIT 1),
    true,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2796' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '170' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, creditos_minimos)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2796' LIMIT 1),
    'CREDITOS',
    33
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '290',
    'MATEMATICA INTERMEDIA 1',
    (SELECT id FROM semestres WHERE numero = 3 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    10
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '290' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '170' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '146',
    'FISICA 1',
    (SELECT id FROM semestres WHERE numero = 3 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    6
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '146' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '170' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '146' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '072' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2794',
    'IDIOMA TECNICO 3',
    (SELECT id FROM semestres WHERE numero = 3 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    true,
    2
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2794' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2793' LIMIT 1)
);

-- SEMESTRE 4 - PENSUM 2016

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '949',
    'ESTADISTICA 1',
    (SELECT id FROM semestres WHERE numero = 4 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '949' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '290' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '949' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2667' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2798',
    'LENGUAJES FORMALES Y DE PROG.',
    (SELECT id FROM semestres WHERE numero = 4 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias de la Computación' LIMIT 1),
    true,
    3
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2798' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2795' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2798' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2796' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2798' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2797' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2799',
    'MATE COMPUTO 2',
    (SELECT id FROM semestres WHERE numero = 4 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2799' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2795' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2799' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2796' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2799' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2797' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2800',
    'INTR. A LA PROG. Y COMPUTACION 2',
    (SELECT id FROM semestres WHERE numero = 4 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Desarrollo de Software' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2800' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2795' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2800' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2796' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2800' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2797' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '085',
    'LOGICA',
    (SELECT id FROM semestres WHERE numero = 4 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias de la Computación' LIMIT 1),
    false,
    2
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '085' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '029' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '291',
    'MATEMATICA INTERMEDIA 2',
    (SELECT id FROM semestres WHERE numero = 4 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '291' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '290' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '292',
    'MATEMATICA INTERMEDIA 3',
    (SELECT id FROM semestres WHERE numero = 4 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '292' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '290' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '147',
    'FISICA 2',
    (SELECT id FROM semestres WHERE numero = 4 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    6
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '147' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '290' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '147' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '146' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2801',
    'IDIOMA TECNICO 4',
    (SELECT id FROM semestres WHERE numero = 4 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    2
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2801' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2794' LIMIT 1)
);

-- SEMESTRE 5 - PENSUM 2016

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2802',
    'ANALISIS PROBABILISTICO',
    (SELECT id FROM semestres WHERE numero = 5 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2802' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '949' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2803',
    'ORG. LENGUAJES Y COMPILADORES 1',
    (SELECT id FROM semestres WHERE numero = 5 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias de la Computación' LIMIT 1),
    true,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2803' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2798' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2803' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2799' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2803' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2800' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2804',
    'ORGANIZACION COMPUTACIONAL',
    (SELECT id FROM semestres WHERE numero = 5 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Infraestructura y Redes' LIMIT 1),
    true,
    3
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2804' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '147' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2804' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2799' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2804' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2800' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2805',
    'ESTRUCTURA DE DATOS',
    (SELECT id FROM semestres WHERE numero = 5 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias de la Computación' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2805' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2798' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2805' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2799' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2805' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2800' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '077',
    'FILOSOFIA DE LA CIENCIA',
    (SELECT id FROM semestres WHERE numero = 5 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    3
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '077' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '029' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, creditos_minimos)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '077' LIMIT 1),
    'CREDITOS',
    90
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '674',
    'MATEMATICA APLICADA 3',
    (SELECT id FROM semestres WHERE numero = 5 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '674' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '291' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '674' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '292' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '673',
    'MATEMATICA APLICADA 1',
    (SELECT id FROM semestres WHERE numero = 5 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    6
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '673' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '291' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '673' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '292' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '694',
    'CONTABILIDAD 1',
    (SELECT id FROM semestres WHERE numero = 5 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    3
);

INSERT INTO prerrequisitos (id_curso, tipo, creditos_minimos)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '694' LIMIT 1),
    'CREDITOS',
    90
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2806',
    'PRINCIPIOS DE METROLOGIA',
    (SELECT id FROM semestres WHERE numero = 5 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    false,
    3
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2806' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '147' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2806' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '216' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2806' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '949' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '094',
    'ECOLOGIA',
    (SELECT id FROM semestres WHERE numero = 5 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    3
);

INSERT INTO prerrequisitos (id_curso, tipo, creditos_minimos)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '094' LIMIT 1),
    'CREDITOS',
    90
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2807',
    'PRACTICA INICIAL TI',
    (SELECT id FROM semestres WHERE numero = 5 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    true,
    0
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2807' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '170' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2807' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2796' LIMIT 1)
);

-- SEMESTRE 6 - PENSUM 2016

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2808',
    'TEORIA DE SISTEMAS 1',
    (SELECT id FROM semestres WHERE numero = 6 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Sistemas de Información' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2808' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '949' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2808' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '674' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2808' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '673' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2808' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2805' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '685',
    'INVESTIGACION DE OPERACIONES 1',
    (SELECT id FROM semestres WHERE numero = 6 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '685' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '949' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '685' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2800' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2809',
    'ECONOMIA',
    (SELECT id FROM semestres WHERE numero = 6 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    true,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2809' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '949' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2810',
    'ORG. LENGUAJES Y COMPILADORES 2',
    (SELECT id FROM semestres WHERE numero = 6 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias de la Computación' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2810' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2803' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2810' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2805' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2811',
    'ARQ. COMPU Y ENSAMBLADORES 1',
    (SELECT id FROM semestres WHERE numero = 6 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Infraestructura y Redes' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2811' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2803' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2811' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2805' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2812',
    'MANEJO E IMPLEMENTACION DE ARCHIVOS',
    (SELECT id FROM semestres WHERE numero = 6 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Sistemas de Información' LIMIT 1),
    true,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2812' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2798' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2812' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2803' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '905',
    'MATEMATICA APLICADA 4',
    (SELECT id FROM semestres WHERE numero = 6 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    false,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '905' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '673' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '904',
    'MATEMATICA APLICADA 2',
    (SELECT id FROM semestres WHERE numero = 6 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    false,
    6
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '904' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '673' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '670',
    'ING. ELECTRICA 1',
    (SELECT id FROM semestres WHERE numero = 6 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    false,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '670' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '292' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '670' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '147' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '779',
    'CONTABILIDAD 2',
    (SELECT id FROM semestres WHERE numero = 6 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    3
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '779' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '694' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2670',
    'GESTION DE DESASTRES',
    (SELECT id FROM semestres WHERE numero = 6 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    3
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2670' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '094' LIMIT 1)
);

-- SEMESTRE 7 - PENSUM 2016

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2813',
    'TEORIA DE SISTEMAS 2',
    (SELECT id FROM semestres WHERE numero = 7 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Sistemas de Información' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2813' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '685' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2813' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2802' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2813' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2808' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '795',
    'INVESTIGACION DE OPERACIONES 2',
    (SELECT id FROM semestres WHERE numero = 7 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '795' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '685' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '950',
    'ESTADISTICA 2',
    (SELECT id FROM semestres WHERE numero = 7 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '950' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '685' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '950' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2802' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '950' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2808' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2814',
    'SISTEMAS OPERATIVOS 1',
    (SELECT id FROM semestres WHERE numero = 7 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Infraestructura y Redes' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2814' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2800' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2814' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2811' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2815',
    'ARQ. COMPU Y ENSAMBLADORES 2',
    (SELECT id FROM semestres WHERE numero = 7 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Infraestructura y Redes' LIMIT 1),
    true,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2815' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2811' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2816',
    'REDES DE COMPUTADORAS 1',
    (SELECT id FROM semestres WHERE numero = 7 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Infraestructura y Redes' LIMIT 1),
    true,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2816' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2811' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2816' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2812' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2817',
    'SISTEMAS DE BASE DE DATOS 1',
    (SELECT id FROM semestres WHERE numero = 7 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Sistemas de Información' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2817' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2803' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2817' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2805' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2817' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2812' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '943',
    'ADMINISTRACION DE EMPRESAS 1',
    (SELECT id FROM semestres WHERE numero = 7 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, creditos_minimos)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '943' LIMIT 1),
    'CREDITOS',
    150
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '919',
    'CONTABILIDAD 3',
    (SELECT id FROM semestres WHERE numero = 7 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    3
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '919' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '779' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2818',
    'PRACTICA INTERMEDIA TI',
    (SELECT id FROM semestres WHERE numero = 7 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    true,
    0
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2818' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2802' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2818' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2803' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2818' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2812' LIMIT 1)
);

-- SEMESTRE 8 - PENSUM 2016

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2819',
    'SISTEMAS OPERATIVOS 2',
    (SELECT id FROM semestres WHERE numero = 8 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Infraestructura y Redes' LIMIT 1),
    true,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2819' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2814' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2820',
    'REDES DE COMPUTADORAS 2',
    (SELECT id FROM semestres WHERE numero = 8 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Infraestructura y Redes' LIMIT 1),
    true,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2820' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2816' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2821',
    'SISTEMAS DE BASE DE DATOS 2',
    (SELECT id FROM semestres WHERE numero = 8 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Sistemas de Información' LIMIT 1),
    true,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2821' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2814' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2821' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2817' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2822',
    'ANALISIS Y DISEÑO DE SISTEMAS 1',
    (SELECT id FROM semestres WHERE numero = 8 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Desarrollo de Software' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2822' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2817' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2823',
    'SEMINARIO DE SISTEMAS 1',
    (SELECT id FROM semestres WHERE numero = 8 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Sistemas de Información' LIMIT 1),
    true,
    3
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2823' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2813' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, creditos_minimos)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2823' LIMIT 1),
    'CREDITOS',
    170
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '690',
    'ING. ECONOMICA 1',
    (SELECT id FROM semestres WHERE numero = 8 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '690' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '949' LIMIT 1)
);

-- SEMESTRE 9 - PENSUM 2016

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2824',
    'MODELACION Y SIMULACION 1',
    (SELECT id FROM semestres WHERE numero = 9 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Inteligencia Artificial' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2824' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '795' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2824' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2813' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2825',
    'SISTEMAS ORGANIZACIONALES Y GERENCIALES 1',
    (SELECT id FROM semestres WHERE numero = 9 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Sistemas de Información' LIMIT 1),
    true,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2825' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2813' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2825' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2822' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2830',
    'EMPRENDEDORES DE NEG. INFORMATICOS',
    (SELECT id FROM semestres WHERE numero = 9 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2830' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2825' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2826',
    'INTELIGENCIA ARTIFICIAL 1',
    (SELECT id FROM semestres WHERE numero = 9 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Inteligencia Artificial' LIMIT 1),
    true,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2826' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2810' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2826' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2813' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2826' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2817' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2831',
    'SEGURIDAD Y AUDITORIAS DE REDES',
    (SELECT id FROM semestres WHERE numero = 9 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Infraestructura y Redes' LIMIT 1),
    false,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2831' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2822' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2827',
    'ANALISIS Y DISEÑO DE SISTEMAS 2',
    (SELECT id FROM semestres WHERE numero = 9 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Desarrollo de Software' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2827' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2822' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2832',
    'SISTEMAS APLICADOS 1',
    (SELECT id FROM semestres WHERE numero = 9 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Sistemas de Información' LIMIT 1),
    false,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2832' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2827' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2833',
    'BASES DE DATOS AVANZADAS',
    (SELECT id FROM semestres WHERE numero = 9 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Sistemas de Información' LIMIT 1),
    false,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2833' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2821' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2828',
    'SEMINARIO DE SISTEMAS 2',
    (SELECT id FROM semestres WHERE numero = 9 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Sistemas de Información' LIMIT 1),
    true,
    3
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2828' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2823' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, creditos_minimos)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2828' LIMIT 1),
    'CREDITOS',
    190
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2672',
    'INTRODUCCION A LA EVALUACION DE IMPACTO AMBIENTAL',
    (SELECT id FROM semestres WHERE numero = 9 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, creditos_minimos)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2672' LIMIT 1),
    'CREDITOS',
    190
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '922',
    'ING. ECONOMICA 2',
    (SELECT id FROM semestres WHERE numero = 9 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '922' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '690' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2570',
    'ETICA PROFESIONAL',
    (SELECT id FROM semestres WHERE numero = 9 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, creditos_minimos)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2570' LIMIT 1),
    'CREDITOS',
    200
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2829',
    'PRACTICA FINAL',
    (SELECT id FROM semestres WHERE numero = 9 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    true,
    0
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2829' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2818' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, creditos_minimos)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2829' LIMIT 1),
    'CREDITOS',
    200
);

-- SEMESTRE 10 - PENSUM 2016

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2834',
    'SISTEMAS ORGANIZACIONALES Y GERENCIALES 2',
    (SELECT id FROM semestres WHERE numero = 10 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Sistemas de Información' LIMIT 1),
    true,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2834' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2825' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2835',
    'MODELACION Y SIMULACION 2',
    (SELECT id FROM semestres WHERE numero = 10 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Inteligencia Artificial' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2835' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2824' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2838',
    'INTELIGENCIA ARTIFICIAL 2',
    (SELECT id FROM semestres WHERE numero = 10 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Inteligencia Artificial' LIMIT 1),
    false,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2838' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2826' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2839',
    'REDES DE NUEVA GENERACION',
    (SELECT id FROM semestres WHERE numero = 10 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Infraestructura y Redes' LIMIT 1),
    false,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2839' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2820' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2836',
    'SOFTWARE AVANZADO',
    (SELECT id FROM semestres WHERE numero = 10 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Desarrollo de Software' LIMIT 1),
    true,
    6
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2836' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2827' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2840',
    'SISTEMAS APLICADOS 2',
    (SELECT id FROM semestres WHERE numero = 10 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Sistemas de Información' LIMIT 1),
    false,
    6
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2840' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2827' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2840' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2832' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2841',
    'AUDITORIA DE PROY. DE SOFTWARE',
    (SELECT id FROM semestres WHERE numero = 10 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Desarrollo de Software' LIMIT 1),
    false,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2841' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2827' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2842',
    'SEMINARIO DE INVESTIGACION EPS',
    (SELECT id FROM semestres WHERE numero = 10 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, creditos_minimos)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2842' LIMIT 1),
    'CREDITOS',
    225
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '912',
    'PLANEAMIENTO',
    (SELECT id FROM semestres WHERE numero = 10 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    6
);

INSERT INTO prerrequisitos (id_curso, tipo, creditos_minimos)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '912' LIMIT 1),
    'CREDITOS',
    190
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '909',
    'PREPARACION Y EVALUACION DE PROYECTOS 1',
    (SELECT id FROM semestres WHERE numero = 10 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    4
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '909' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '690' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, creditos_minimos)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '909' LIMIT 1),
    'CREDITOS',
    190
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '2837',
    'SEMINARIO DE INVESTIGACION',
    (SELECT id FROM semestres WHERE numero = 10 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    true,
    3
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2837' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '2828' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, creditos_minimos)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '2837' LIMIT 1),
    'CREDITOS',
    220
);

-- SEMESTRE 1 - PENSUM 2025

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '3003',
    'Área Social Humanística 1',
    (SELECT id FROM semestres WHERE numero = 1 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2025' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    true,
    3
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '3000',
    'Área Matemática Básica 1',
    (SELECT id FROM semestres WHERE numero = 1 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2025' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    9
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '3005',
    'Técnicas de Estudio e Investigación',
    (SELECT id FROM semestres WHERE numero = 1 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2025' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    true,
    3
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '3082',
    'Deportes 1',
    (SELECT id FROM semestres WHERE numero = 1 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2025' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    2
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '3081',
    'Idioma Técnico 1',
    (SELECT id FROM semestres WHERE numero = 1 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2025' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    3
);

-- SEMESTRE 2 - PENSUM 2025

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '3011',
    'Área Social Humanística 2',
    (SELECT id FROM semestres WHERE numero = 2 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2025' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    true,
    3
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3011' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3003' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '3006',
    'Área Matemática Básica 2',
    (SELECT id FROM semestres WHERE numero = 2 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2025' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    9
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3006' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3000' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '3231',
    'Matemática para computación 1',
    (SELECT id FROM semestres WHERE numero = 2 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2025' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3231' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3000' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '3007',
    'Física Básica',
    (SELECT id FROM semestres WHERE numero = 2 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2025' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3007' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3000' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '3086',
    'Deportes 2',
    (SELECT id FROM semestres WHERE numero = 2 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2025' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    2
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3086' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3082' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '3085',
    'Idioma Técnico 2',
    (SELECT id FROM semestres WHERE numero = 2 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2025' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    3
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3085' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3081' LIMIT 1)
);

-- SEMESTRE 3 - PENSUM 2025

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '3232',
    'Lógica de Sistemas',
    (SELECT id FROM semestres WHERE numero = 3 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2025' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias de la Computación' LIMIT 1),
    true,
    3
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3232' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3006' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3232' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3007' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3232' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3231' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '3233',
    'Matemática para computación 2',
    (SELECT id FROM semestres WHERE numero = 3 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2025' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3233' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3006' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3233' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3007' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3233' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3231' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '3234',
    'Introducción a la Programación y Computación 1',
    (SELECT id FROM semestres WHERE numero = 3 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2025' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Desarrollo de Software' LIMIT 1),
    true,
    6
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3234' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3006' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3234' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3007' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3234' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3231' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '3013',
    'Área Matemática Intermedia 1',
    (SELECT id FROM semestres WHERE numero = 3 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2025' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    9
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3013' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3006' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '3014',
    'Física 1',
    (SELECT id FROM semestres WHERE numero = 3 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2025' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Ciencias Básicas y Mate' LIMIT 1),
    true,
    5
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3014' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3006' LIMIT 1)
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3014' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3007' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '3019',
    'Ética Profesional',
    (SELECT id FROM semestres WHERE numero = 3 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2025' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    2
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3019' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3011' LIMIT 1)
);

INSERT INTO cursos (codigo, nombre, id_semestre, id_area, obligatorio, creditos)
VALUES (
    '3098',
    'Idioma Técnico 3',
    (SELECT id FROM semestres WHERE numero = 3 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2025' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    3
);

INSERT INTO prerrequisitos (id_curso, tipo, id_curso_prereq)
VALUES (
    (SELECT id FROM cursos WHERE codigo = '3098' LIMIT 1),
    'CURSO',
    (SELECT id FROM cursos WHERE codigo = '3085' LIMIT 1)
);

