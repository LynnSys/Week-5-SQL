CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    department_id INT,
    is_active BIT NOT NULL,
    created_by VARCHAR(50),
    join_date DATE,
    updated_by VARCHAR(50),
    updated_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

CREATE TABLE assignments (
    emp_id INT,
    project_name VARCHAR(50) NOT NULL,
    createdBy VARCHAR(50),
    createdDate DATE,
    updatedBy VARCHAR(50),
    updatedDate DATE,
    startDate DATE NOT NULL,
    endDate DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO departments (id, name) VALUES
(1, 'DOTNET'),
(2, 'SpringBoot'),
(3, 'Flutter'),
(4, 'AngularJS'),
(5, 'ReactJS'),
(6, 'QA'),
(7, 'Power Apps');

select * FROM departments;

INSERT INTO employees (emp_id, first_name, last_name, department_id, is_active, created_by, join_date, updated_by, updated_date) VALUES
(1, 'Lynn', 'Locksley', 3, 1, 'Mithun Abhishek','2020-01-01', 'Binesh Kurrupa', '2024-03-01'),
(2, 'Aditya','Krishna', 2, 1, 'Johnson George','2019-06-15', 'Surendrakumar E', '2024-02-18'),
(3, 'Priyanka', 'Fernandes', 6, 1, 'Srijit Unnikumar Nair', '2021-03-20', 'Surendrakumar E', '2024-03-01'),
(4, 'Bindhu', 'Manikya', 4, 1, 'Srijit Unnikumar Nair', '2023-11-20', 'Surendrakumar E', '2024-03-01'),
(5, 'Amitha', 'Vivek', 1, 1, 'Surendrakumar E', '2024-09-28', 'Binesh Kurrupa', '2024-03-01'),
(6, 'Pranit', 'Bhonsle', 2, 1, 'Sadhana Shukla', '2024-03-20', 'Srijit Unnikumar Nair', '2024-03-01'),
(7, 'Hitesh', 'KP', 1, 1, 'Manoj kumar', '2023-07-10', 'Srijit Unnikumar Nair', '2024-03-01');

update departments set name ='Cloud' where id=5;
delete from departments where id = 7;

select * FROM employees;
select * FROM departments;

ALTER TABLE assignments
DROP column emp_id;

select * from assignments;


INSERT INTO assignments (proj_id, project_name, createdBy, createdDate, updatedBy, updatedDate, startDate, endDate) VALUES
(1, 'ProjectA', 'Mithun Abhishek', '2023-03-12', 'Mithun Abhishek', '2023-03-15', '2023-03-15', '2023-04-30'),
(2, 'ProjectB', 'Manoj Kumar', '2022-03-12', 'Manoj Kumar', '2022-03-14', '2022-03-14', '2022-05-15'),
(3, 'ProjectC', 'Surendrakumar E', '2024-03-12', 'Surendrakumar E', '2024-03-16', '2024-03-16', '2024-04-20'),
(4, 'ProjectD', 'Srijit Unnikumar Nair', '2024-03-12', 'Srijit Unnikumar Nair', '2024-03-17', '2024-03-17', '2024-04-10'),
(5, 'ProjectE', 'Sophia Martinez', '2024-03-12', 'Ethan Jones', '2024-03-18', '2024-03-18', '2024-05-01');

ALTER TABLE assignments
ADD proj_id INT NOT NULL PRIMARY KEY;

CREATE TABLE todoList(
    map_id INT NOT NULL PRIMARY KEY,
    emp_id INT,
    proj_id INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (proj_id) REFERENCES assignments(proj_id)
)

select * from todoList;

INSERT INTO todoList (map_id,emp_id,proj_id) VALUES
(1,1,1),
(2,2,1),
(3,1,2),
(4,3,2),
(5,3,3),
(6,4,4),
(7,5,5), 
(8,6,5),
(9,7,5);


SELECT *
FROM employees
WHERE YEAR(join_date) = 2023;

select *
from employees e, departments d
WHERE e.department_id=d.id;

UPDATE employees
SET first_name = 'Liona'
WHERE emp_id=1;
select *
FROM employees;

delete from todoList where map_id=9;

DELETE FROM employees
WHERE emp_id=7;

create table dummy(
    id INT PRIMARY KEY, 
    name1 VARCHAR(20)
)
insert into dummy(id, name1) values
(1,'Lynn'),
(2,'Liona'),
(3,'Leon');

select * from dummy;

drop table dummy;

TRUNCATE TABLE dummy;

select e.first_name, a.project_name
from 
employees AS e LEFT JOIN todoList AS t
ON e.emp_id = t.emp_id
RIGHT JOIN assignments AS a
ON a.proj_id=t.proj_id