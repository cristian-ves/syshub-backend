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
    'PRACTICA INICIAL',
    (SELECT id FROM semestres WHERE numero = 5 AND id_pensum = (SELECT id FROM pensums WHERE nombre = 'Pensum 2016' LIMIT 1) LIMIT 1),
    (SELECT id FROM areas_tecnicas WHERE nombre = 'Gestión y Gerencia' LIMIT 1),
    false,
    11
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