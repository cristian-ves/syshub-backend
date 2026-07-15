

-- ============ STUDY PLAN 2016 ============

-- SEMESTER 3

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D101',
        'Introduction to Programming',
        (SELECT id
         FROM semesters
         WHERE number = 3 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2016' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Software Development' LIMIT 1)
    , true
    , 5
    );

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D102',
        'Discrete Structures',
        (SELECT id
         FROM semesters
         WHERE number = 3 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2016' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Computer Science' LIMIT 1)
    , true
    , 4
    );

-- SEMESTER 4

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D103',
        'Object-Oriented Programming',
        (SELECT id
         FROM semesters
         WHERE number = 4 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2016' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Software Development' LIMIT 1)
    , true
    , 5
    );

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D104',
        'Data Structures and Algorithms',
        (SELECT id
         FROM semesters
         WHERE number = 4 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2016' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Computer Science' LIMIT 1)
    , true
    , 5
    );

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D105',
        'Computer Architecture',
        (SELECT id
         FROM semesters
         WHERE number = 4 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2016' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Infrastructure and Networks' LIMIT 1)
    , true
    , 4
    );

-- SEMESTER 5

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D106',
        'Database Systems I',
        (SELECT id
         FROM semesters
         WHERE number = 5 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2016' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Information Systems' LIMIT 1)
    , true
    , 5
    );

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D107',
        'Operating Systems I',
        (SELECT id
         FROM semesters
         WHERE number = 5 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2016' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Infrastructure and Networks' LIMIT 1)
    , true
    , 5
    );

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D108',
        'Algorithm Analysis',
        (SELECT id
         FROM semesters
         WHERE number = 5 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2016' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Computer Science' LIMIT 1)
    , true
    , 4
    );

-- SEMESTER 6

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D109',
        'Database Systems II',
        (SELECT id
         FROM semesters
         WHERE number = 6 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2016' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Information Systems' LIMIT 1)
    , true
    , 5
    );

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D110',
        'Computer Networks I',
        (SELECT id
         FROM semesters
         WHERE number = 6 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2016' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Infrastructure and Networks' LIMIT 1)
    , true
    , 5
    );

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D111',
        'Software Engineering I',
        (SELECT id
         FROM semesters
         WHERE number = 6 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2016' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Software Development' LIMIT 1)
    , true
    , 4
    );

-- SEMESTER 7

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D112',
        'Web Application Development',
        (SELECT id
         FROM semesters
         WHERE number = 7 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2016' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Software Development' LIMIT 1)
    , true
    , 5
    );

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D113',
        'Systems Analysis and Design',
        (SELECT id
         FROM semesters
         WHERE number = 7 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2016' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Information Systems' LIMIT 1)
    , true
    , 4
    );

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D114',
        'Operating Systems II',
        (SELECT id
         FROM semesters
         WHERE number = 7 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2016' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Infrastructure and Networks' LIMIT 1)
    , true
    , 4
    );

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D115',
        'Introduction to Artificial Intelligence',
        (SELECT id
         FROM semesters
         WHERE number = 7 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2016' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Artificial Intelligence' LIMIT 1)
    , false
    , 3
    );

-- SEMESTER 8

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D116',
        'Software Engineering II',
        (SELECT id
         FROM semesters
         WHERE number = 8 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2016' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Software Development' LIMIT 1)
    , true
    , 5
    );

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D117',
        'Compiler Design',
        (SELECT id
         FROM semesters
         WHERE number = 8 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2016' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Computer Science' LIMIT 1)
    , true
    , 4
    );

-- ============ STUDY PLAN 2025 ============

-- SEMESTER 3

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D201',
        'Programming Fundamentals',
        (SELECT id
         FROM semesters
         WHERE number = 3 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2025' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Software Development' LIMIT 1)
    , true
    , 5
    );

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D202',
        'Data Structures',
        (SELECT id
         FROM semesters
         WHERE number = 3 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2025' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Computer Science' LIMIT 1)
    , true
    , 5
    );

-- SEMESTER 4

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D203',
        'Database Fundamentals',
        (SELECT id
         FROM semesters
         WHERE number = 4 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2025' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Information Systems' LIMIT 1)
    , true
    , 5
    );

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D204',
        'Computer Networks Fundamentals',
        (SELECT id
         FROM semesters
         WHERE number = 4 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2025' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Infrastructure and Networks' LIMIT 1)
    , true
    , 4
    );

-- SEMESTER 5

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D205',
        'Mobile Application Development',
        (SELECT id
         FROM semesters
         WHERE number = 5 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2025' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Software Development' LIMIT 1)
    , true
    , 4
    );

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D206',
        'Distributed Systems',
        (SELECT id
         FROM semesters
         WHERE number = 5 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2025' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Infrastructure and Networks' LIMIT 1)
    , true
    , 4
    );

-- SEMESTER 6

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D208',
        'Software Project Management',
        (SELECT id
         FROM semesters
         WHERE number = 6 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2025' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Management and Leadership' LIMIT 1)
    , true
    , 3
    );

INSERT INTO courses (code, name, semester_id, area_id, required, credits)
VALUES ('D209',
        'Cloud Computing',
        (SELECT id
         FROM semesters
         WHERE number = 6 AND study_plan_id = (SELECT id FROM study_plans WHERE name = 'Study Plan 2025' LIMIT 1) LIMIT 1),
    (
SELECT id
FROM technical_areas
WHERE name = 'Infrastructure and Networks' LIMIT 1)
    , true
    , 4
    );