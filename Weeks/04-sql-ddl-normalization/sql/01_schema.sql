-- Week 4: CourseHub normalized schema
-- PostgreSQL
-- WARNING: The DROP statements delete these tables and their data.
-- Remove the DROP statements if you need to preserve existing data.

DROP TABLE IF EXISTS enrollment CASCADE;
DROP TABLE IF EXISTS course CASCADE;
DROP TABLE IF EXISTS student CASCADE;
DROP TABLE IF EXISTS instructor CASCADE;
DROP TABLE IF EXISTS programme CASCADE;

CREATE TABLE programme (
    programme_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    programme_name VARCHAR(120) NOT NULL UNIQUE
);

CREATE TABLE instructor (
    instructor_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    instructor_name VARCHAR(150) NOT NULL
);

CREATE TABLE student (
    student_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    email VARCHAR(254) NOT NULL UNIQUE,
    programme_id INTEGER NOT NULL,
    CONSTRAINT student_programme_fk
        FOREIGN KEY (programme_id)
        REFERENCES programme (programme_id)
);

CREATE TABLE course (
    course_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    credits INTEGER NOT NULL,
    instructor_id INTEGER NOT NULL,
    CONSTRAINT course_credits_check CHECK (credits > 0 AND credits <= 30),
    CONSTRAINT course_instructor_fk
        FOREIGN KEY (instructor_id)
        REFERENCES instructor (instructor_id)
);

CREATE TABLE enrollment (
    enrollment_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    enrollment_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT enrollment_status_check
        CHECK (status IN ('active', 'completed', 'withdrawn')),
    CONSTRAINT enrollment_student_fk
        FOREIGN KEY (student_id)
        REFERENCES student (student_id),
    CONSTRAINT enrollment_course_fk
        FOREIGN KEY (course_id)
        REFERENCES course (course_id),
    CONSTRAINT enrollment_student_course_unique
        UNIQUE (student_id, course_id)
);
