-- Initial data required for the system to work
INSERT INTO roles (name)
VALUES ('ROLE_ADMIN'),
       ('ROLE_ASSISTANT'),
       ('ROLE_STUDENT');
select *
from roles;

-- Major inserts
INSERT INTO majors (name)
VALUES ('Computer Science and Systems Engineering'),
       ('Mechanical Engineering'),
       ('Industrial Mechanical Engineering'),
       ('Civil Engineering'),
       ('Industrial Engineering');

INSERT INTO technical_areas (name, description, color)
VALUES ('Software Development', 'Courses focused on application development, patterns, and languages.',
        '#10b981'),                                                                                            -- Emerald
       ('Computer Science', 'Theoretical foundations, algorithms, data structures, and logic.', '#3b82f6'),    -- Blue
       ('Information Systems', 'Data management, systems analysis, and information flows.', '#f59e0b'),        -- Amber
       ('Infrastructure and Networks', 'Hardware, operating systems, networks, and communications.',
        '#6366f1'),                                                                                            -- Indigo
       ('Artificial Intelligence', 'Data modeling, machine learning, and expert systems.', '#8b5cf6'),         -- Violet
       ('Management and Leadership', 'Project management, ethics, and leadership in engineering.', '#f43f5e'), -- Pink
       ('Basic Sciences and Math', 'Fundamentals of physics and math applied to engineering.', '#64748b');     -- Slate Gray

-- Insert Study Plans for the Systems major
INSERT INTO study_plans (name, major_id)
VALUES ('Study Plan 2016', (SELECT id FROM majors WHERE name = 'Computer Science and Systems Engineering' LIMIT 1) );

INSERT INTO study_plans (name, major_id)
VALUES ('Study Plan 2025', (SELECT id FROM majors WHERE name = 'Computer Science and Systems Engineering' LIMIT 1) );

-- Insert the 10 semesters for Study Plan 2016
INSERT INTO semesters (number, study_plan_id)
SELECT s, p.id
FROM generate_series(1, 10) s
         JOIN study_plans p ON p.name = 'Study Plan 2016'
WHERE p.major_id = (SELECT id FROM majors WHERE name = 'Computer Science and Systems Engineering' LIMIT 1);

-- Insert the 10 semesters for Study Plan 2025
INSERT INTO semesters (number, study_plan_id)
SELECT s, p.id
FROM generate_series(1, 10) s
         JOIN study_plans p ON p.name = 'Study Plan 2025'
WHERE p.major_id = (SELECT id FROM majors WHERE name = 'Computer Science and Systems Engineering' LIMIT 1);


-- Insert users
INSERT INTO users (username, email, password, full_name, academic_record, role_id, major_id)
VALUES ('admin', 'alejandrovasquezesc@gmail.com', '$2a$10$0MQnbK1b.hliG9iFESB47eMJTdKUjrjj.kDu1D0KNV3Rjd5yjs1BC',
        'Thom Yorke', '202131936', 1, 1),
       ('auxi', 'cristianvasquez202131936', '$2a$10$0MQnbK1b.hliG9iFESB47eMJTdKUjrjj.kDu1D0KNV3Rjd5yjs1BC',
        'Chris Cornell', '202012345a', 2, 1),
       ('student', 'syshubapp@gmail.com', '$2a$10$0MQnbK1b.hliG9iFESB47eMJTdKUjrjj.kDu1D0KNV3Rjd5yjs1BC',
        'Chino Moreno', '202054321', 3, 1);-- Demo users (one per role, for the deployed demo)

INSERT INTO users (username, email, password, full_name, academic_record, role_id, major_id)
VALUES
    ('demo_admin', 'admin@demo.com', '$2a$10$6fQT1zdofnNiW5Gvqk86OuerWRmq/KJ7rykH20jOp65APTpm4EN7e', 'Demo Admin', '202100001',
     (SELECT id FROM roles WHERE name = 'ROLE_ADMIN'), 1),
    ('demo_assistant', 'assistant@demo.com', '$2a$10$6fQT1zdofnNiW5Gvqk86OuerWRmq/KJ7rykH20jOp65APTpm4EN7e', 'Demo Assistant', '202100002',
     (SELECT id FROM roles WHERE name = 'ROLE_AUXILIAR'), 1),
    ('demo_student', 'student@demo.com', '$2a$10$6fQT1zdofnNiW5Gvqk86OuerWRmq/KJ7rykH20jOp65APTpm4EN7e', 'Demo Student', '202100003',
     (SELECT id FROM roles WHERE name = 'ROLE_ESTUDIANTE'), 1)
    ON CONFLICT (username) DO NOTHING;