CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY, -- Уникальный идентификатор студента
    full_name VARCHAR(255) NOT NULL, -- Полное имя студента
    email VARCHAR(255) UNIQUE NOT NULL, -- Электронная почта студента (должна быть уникальной)
    start_year INT -- Год поступления студента
);

CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY, -- Уникальный идентификатор курса
    course_name VARCHAR(255) NOT NULL, -- Название курса
    credits INT CHECK (credits > 0) -- Количество зачетных единиц курса (должно быть больше 0)
);

CREATE TABLE Enrollments (
    student_id INT REFERENCES Students(student_id) ON DELETE CASCADE, -- Ссылка на ID студента (внешний ключ)
    course_id INT REFERENCES Courses(course_id) ON DELETE CASCADE, -- Ссылка на ID курса (внешний ключ)
    grade CHAR(1), -- Оценка студента за курс (например, 'A', 'B', 'C')
    PRIMARY KEY (student_id, course_id)
);
INSERT INTO Students (full_name, email, start_year) VALUES
('Алексей Смирнов','smirnov@mail.ru', 2021),
('Елена Кузнецова','elena@mail.ru', 2022),
('Дмитрий Новиков','novikov@mail.ru', 2021),
('Ольгу Морозову','moroz@mail.ru', 2023);

INSERT INTO Courses (course_name, credits) VALUES
('Введение в программирование',5),
('База данных',4),
('Веб-технологии',4);
INSERT INTO enrollments(student_id,course_id,grade)VALUES
(7,2,'A'),
(8,2,'A'),
(9,1,NULL),
(9,2,NULL),
(9,3,NULL);
UPDATE students
SET email='elena.kuznetsova@newmail.com'
WHERE email='elena@mail.ru';
UPDATE enrollments 
SET grade='A'
WHERE course_id = 1 and student_id = 9;
DELETE FROM Students
WHERE email = 'moroz@mail.ru';

SELECT*FROM students;

SELECT course_name,credits FROM courses;
SELECT * FROM Students WHERE start_year = 2021;
SELECT*FROM courses WHERE credits >4;
SELECT * FROM Students WHERE email = 'elena.kuznetsova@newmail.com';

SELECT * FROM Students WHERE full_name LIKE 'Дмитрий%';

SELECT * FROM enrollments WHERE grade IS NULL;
SELECT * FROM courses ORDER BY course_name;
SELECT * FROM students ORDER BY start_year, full_name ;
SELECT * FROM students ORDER BY start_year DESC LIMIT 2;
