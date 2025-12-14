DROP TABLE IF EXISTS Order_Items;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255));
    
CREATE TABLE team_members(
    member_id INT  PRIMARY KEY,
    project_id INT, 
    member_name VARCHAR (300),
    FOREIGN KEY(project_id)REFERENCES Projects(project_id)
);
-- 1 task:в участниках проекта значение были просто через запятую и были не атомарными
CREATE Table clients(
    client_id INT PRIMARY KEY,
    client_name VARCHAR(255),
    client_email VARCHAR(255)
);
CREATE TABLE Equipment(
    equipment_id INT PRIMARY KEY,
    equipment_name VARCHAR(255)
);
CREATE TABLE EquipmentRentals (
    client_id INT,
    equipment_id INT,
    rental_date DATE,
    PRIMARY KEY (client_id, equipment_id),
    FOREIGN KEY(client_id) REFERENCES clients(client_id),
    FOREIGN KEY(equipment_id) REFERENCES Equipment(equipment_id)
);
CREATE TABLE students(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255)
);
CREATE TABLE course(
    course_id INT PRIMARY KEY,
    course_professor VARCHAR(255)
);
CREATE TABLE yspevaemost(
    student_id INT,
    course_id INT,
    assigments_name VARCHAR(150),
    grade INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY(student_id) REFERENCES students(student_id),
    FOREIGN KEY(course_id) REFERENCES course(course_id)
);
-- эксплейн: в поле assignments_and_grades TEXT, были неатомарные значение так как шли в ряд чере запятую это и было нарушением 1нф
-- также некотоыре значения либо частично либо вовсе не зависили от первичного ключа