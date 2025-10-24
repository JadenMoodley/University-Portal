-- Database:

DROP TABLE IF EXISTS student_course;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;

-- Courses
CREATE TABLE courses (
  course_id SERIAL PRIMARY KEY,

  course_code VARCHAR(20) NOT NULL UNIQUE,
  course_name VARCHAR(200) NOT NULL,
  instructor VARCHAR(100) NOT NULL,
  schedule VARCHAR(100) NOT NULL
);

-- Students
CREATE TABLE students (
  student_id INT PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(200) NOT NULL UNIQUE
);

-- Enrollments
CREATE TABLE student_course (
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  PRIMARY KEY (student_id, course_id),
  FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
  FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

-- Seed data
INSERT INTO courses (course_code, course_name, instructor, schedule) VALUES
('CS101', 'Intro to Computer Science', 'Dr. L. Ndlovu', 'Mon 09:00-11:00'),
('DB202', 'Relational Databases', 'Prof. P. Naidoo', 'Wed 10:00-12:00'),
('SE301', 'Software Engineering', 'Dr. A. Moyo', 'Fri 13:00-15:00');

INSERT INTO students (student_id, first_name, last_name, email) VALUES
(1001, 'Amahle', 'Dlamini', 'amahle.dlamini@example.edu'),
(1002, 'Thabo', 'Maseko', 'thabo.maseko@example.edu');

INSERT INTO student_course (student_id, course_id)
SELECT 1001, course_id FROM courses WHERE course_code IN ('CS101','DB202');
INSERT INTO student_course (student_id, course_id)
SELECT 1002, course_id FROM courses WHERE course_code IN ('DB202','SE301');
