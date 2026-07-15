-- Drop tables if they exist (in reverse order due to foreign keys)

DROP TABLE IF EXISTS article_tags;
DROP TABLE IF EXISTS article_favorites;
DROP TABLE IF EXISTS votes;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS articles;

DROP TABLE IF EXISTS project_tags;
DROP TABLE IF EXISTS attachments;

DROP TABLE IF EXISTS projects;

DROP TABLE IF EXISTS prerequisites;
DROP TABLE IF EXISTS users;

DROP TABLE IF EXISTS courses;

DROP TABLE IF EXISTS semesters;

DROP TABLE IF EXISTS study_plans;
DROP TABLE IF EXISTS technical_areas;
DROP TABLE IF EXISTS tags;

DROP TABLE IF EXISTS majors;
DROP TABLE IF EXISTS roles;

-- Create Roles table
CREATE TABLE roles
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

-- Create Majors table
CREATE TABLE majors
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE study_plans
(
    id       SERIAL PRIMARY KEY,
    name     VARCHAR(50) NOT NULL,
    major_id INTEGER     NOT NULL,
    CONSTRAINT fk_study_plan_major FOREIGN KEY (major_id) REFERENCES majors (id)
);


CREATE TABLE semesters
(
    id            SERIAL PRIMARY KEY,
    number        INTEGER NOT NULL,
    study_plan_id INTEGER NOT NULL,
    CONSTRAINT fk_semester_study_plan FOREIGN KEY (study_plan_id) REFERENCES study_plans (id)
);

CREATE TABLE technical_areas
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    color       VARCHAR(7) DEFAULT '#64748b'
);

CREATE TABLE courses
(
    id          SERIAL PRIMARY KEY,
    code        VARCHAR(20)  NOT NULL,
    credits     INTEGER      NOT NULL DEFAULT 0,
    name        VARCHAR(150) NOT NULL,
    semester_id INTEGER      NOT NULL,
    area_id     INTEGER      NOT NULL,
    required    BOOLEAN      NOT NULL,
    CONSTRAINT fk_course_semester FOREIGN KEY (semester_id) REFERENCES semesters (id),
    CONSTRAINT fk_course_area FOREIGN KEY (area_id) REFERENCES technical_areas (id)
);

CREATE TABLE prerequisites
(
    id                     SERIAL PRIMARY KEY,
    course_id              INTEGER     NOT NULL,
    type                   VARCHAR(20) NOT NULL CHECK (type IN ('COURSE', 'CREDITS')),
    prerequisite_course_id INTEGER,
    minimum_credits        INTEGER,

    CONSTRAINT fk_prerequisite_course FOREIGN KEY (course_id) REFERENCES courses (id),
    CONSTRAINT fk_prerequisite_course_prerequisite FOREIGN KEY (prerequisite_course_id) REFERENCES courses (id),

    CONSTRAINT check_prerequisite_type CHECK (
        (type = 'COURSE' AND prerequisite_course_id IS NOT NULL AND minimum_credits IS NULL) OR
        (type = 'CREDITS' AND minimum_credits IS NOT NULL AND prerequisite_course_id IS NULL)
        )
);

CREATE TABLE tags
(
    id    SERIAL PRIMARY KEY,
    name  VARCHAR(50) UNIQUE NOT NULL,
    color VARCHAR(7) DEFAULT '#3b82f6'
);

-- Users table
CREATE TABLE users
(
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username        VARCHAR(50) UNIQUE  NOT NULL,
    email           VARCHAR(100) UNIQUE NOT NULL,
    password        VARCHAR(255)        NOT NULL,
    full_name       VARCHAR(100)        NOT NULL,
    academic_record VARCHAR(20) UNIQUE,
    role_id         INTEGER             NOT NULL,
    major_id        INTEGER,
    enabled         BOOLEAN          DEFAULT TRUE,
    created_at      TIMESTAMP        DEFAULT CURRENT_TIMESTAMP,

    -- Relationships
    CONSTRAINT fk_user_role FOREIGN KEY (role_id) REFERENCES roles (id),
    CONSTRAINT fk_user_major FOREIGN KEY (major_id) REFERENCES majors (id)
);

CREATE TABLE projects
(
    id          SERIAL PRIMARY KEY,
    title       VARCHAR(255) NOT NULL,
    description TEXT,
    repo_url    VARCHAR(255),
    featured    BOOLEAN   DEFAULT FALSE,
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id     UUID         NOT NULL,
    course_id   INTEGER      NOT NULL,

    CONSTRAINT fk_projects_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT fk_projects_course FOREIGN KEY (course_id) REFERENCES courses (id)
);

CREATE TABLE attachments
(
    id            SERIAL PRIMARY KEY,
    original_name VARCHAR(255) NOT NULL,
    file_name     VARCHAR(255) NOT NULL,
    file_type     VARCHAR(100),
    project_id    INTEGER      NOT NULL,

    CONSTRAINT fk_attachments_project FOREIGN KEY (project_id) REFERENCES projects (id) ON DELETE CASCADE
);

CREATE TABLE project_tags
(
    project_id INTEGER NOT NULL,
    tag_id     INTEGER NOT NULL,
    PRIMARY KEY (project_id, tag_id),

    CONSTRAINT fk_project_tags_project FOREIGN KEY (project_id) REFERENCES projects (id) ON DELETE CASCADE,
    CONSTRAINT fk_project_tags_tag FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE
);

CREATE TABLE articles
(
    id         SERIAL PRIMARY KEY,
    title      VARCHAR(255)        NOT NULL,
    slug       VARCHAR(255) UNIQUE NOT NULL,
    excerpt    TEXT,
    content    TEXT                NOT NULL,
    user_id    UUID                NOT NULL,
    course_id  INTEGER             NOT NULL,
    status     VARCHAR(20) DEFAULT 'PUBLISHED' CHECK (status IN ('DRAFT', 'PUBLISHED')),
    created_at TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    points     INTEGER     DEFAULT 0,

    CONSTRAINT fk_articles_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT fk_articles_course FOREIGN KEY (course_id) REFERENCES courses (id)
);

CREATE TABLE comments
(
    id          SERIAL PRIMARY KEY,
    content     TEXT        NOT NULL,
    user_id     UUID        NOT NULL,
    target_id   INTEGER     NOT NULL,
    target_type VARCHAR(20) NOT NULL CHECK (target_type IN ('ARTICLE', 'FORUM')),
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_comments_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE votes
(
    id          SERIAL PRIMARY KEY,
    user_id     UUID        NOT NULL,
    target_id   INTEGER     NOT NULL,
    target_type VARCHAR(20) NOT NULL CHECK (target_type IN ('ARTICLE', 'FORUM')),
    value       INTEGER     NOT NULL CHECK (value IN (1, -1)),

    CONSTRAINT fk_votes_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT unq_user_vote UNIQUE (user_id, target_id, target_type)
);

CREATE TABLE article_favorites
(
    id         SERIAL PRIMARY KEY,
    user_id    UUID    NOT NULL,
    article_id INTEGER NOT NULL,
    saved_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_favorite_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT fk_favorite_article FOREIGN KEY (article_id) REFERENCES articles (id) ON DELETE CASCADE,
    CONSTRAINT unique_user_article UNIQUE (user_id, article_id)
);

CREATE TABLE article_tags
(
    article_id INTEGER NOT NULL,
    tag_id     INTEGER NOT NULL,
    PRIMARY KEY (article_id, tag_id),
    CONSTRAINT fk_article_tags_article FOREIGN KEY (article_id) REFERENCES articles (id) ON DELETE CASCADE,
    CONSTRAINT fk_article_tags_tag FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE
);