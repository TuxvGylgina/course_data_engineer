CREATE TYPE grade_type AS ENUM ('junior', 'middle', 'senior', 'lead');
CREATE TYPE score_type AS ENUM ('A', 'B', 'C', 'D', 'E');

//таблица с сотрудниками//

CREATE TABLE IF NOT EXISTS employees (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    surname CHARACTER VARYING (100) NOT NULL,
	  name_employee CHARACTER VARYING (100) NOT NULL,
	  patronymic CHARACTER VARYING (100) NOT NULL,
    brithdate DATE NOT NULL,
	  start_date DATE NOT NULL,
	  job_title CHARACTER VARYING (100) NOT NULL,
    grade grade_type NOT NULL,
    salary INT,
    department_id INT,
    driver_license BOOLEAN,
    CONSTRAINT departament_fk FOREIGN KEY (departament_id)
	     REFERENCES departaments(id) ON DELETE CASCADE);
       
//таблица с департаментами//
  
CREATE TABLE IF NOT EXISTS departaments (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name CHARACTER VARYING (100) NOT NULL ,
    director_name VARCHAR (100) NOT NULL,
	  employee_count SMALLINT);
    
//таблица с оценками//
  
CREATE TABLE IF NOT EXISTS scores (
	 scores_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
     employee_id INT,
     q1 score_type,
     q2 score_type,
     q3 score_type,
     q4 score_type,
	   premium INT,
	   CONSTRAINT employee_fk FOREIGN KEY (employee_id)
	      REFERENCES  employees(id) ON DELETE CASCADE);
	
//ввод данных в таблицу департамента//

INSERT INTO departaments (
    name,
    director_name,
    employee_count
)
VALUES
    ('Data engineering', 'Иванов', 3),
	  ('Data analyst', 'Петров', 2);

//ввод данных в таблицу с сотрудниками//

INSERT INTO employees (
     surname,
	   name_employee,
	   patronymic,
     brithdate,
	   start_date,
	   job_title,
     grade,
     salary,
     departament_id,
	   driver_license
)
VALUES
  ('Иванов', 'Иван', 'Иванович',  '1998-02-03','2000-03-15', 'инженер', 'middle', 150000, 1, True),
	('Петров', 'Петр', 'Петрович', '1997-03-11', '2003-06-01', 'инженер', 'junior', 80000, 1, False),
	('Сидоров', 'Алексей', 'Антонович', '1993-06-01','2000-09-11', 'старший инженер', 'senior', 250000, 1, True),
	('Белова', 'Анастасия', 'Петровна', '1999-10-03', '2004-10-18', 'бухгалтер', 'middle', 130000, 2, True),
	('Никетенко', 'Анна', 'Николаевна', '1997-02-21', '2006-05-26', 'HR', 'junior', 70000, 2, False);
 
//ввод данных в таблицу департамента//

INSERT INTO departaments (
    name,
    director_name,
    employee_count
)
VALUES
    ('Data Mining', 'Сироткин', 2);
    
//ввод данных в таблицу с сотрудниками//
    
INSERT INTO employees (
       surname,
	     name_employee,
	     patronymic,
       brithdate,
	     start_date,
	     job_title,
       grade,
       salary,
       departament_id,
	     driver_license
)
VALUES
  ('Сироткин', 'Юрий', 'Иванович',  '1990-07-13','2022-11-28', 'Главный инженер', 'lead', 350000, 3, True),
  ('Канакина', 'Юлия', 'Михайловна',  '1995-07-22','2022-11-28', 'Инженер', 'junior', 50000, 3, False),
  ('Сироткин', 'Андрей', 'Альбертович',  '1998-09-03','2022-11-28', 'Инженер', 'senior', 150000, 3, False);
  
                      ///анализ таблиц///
                      
1 Уникальный номер сотрудника, его ФИО и стаж работы – для всех сотрудников компании

select id, surname, name_employee, patronymic, DATE_PART('year',NOW())- DATE_PART('year',start_date) as experience  from employees e;

2 Уникальный номер сотрудника, его ФИО и стаж работы – только первых 3-х сотрудников

select id, surname, name_employee, patronymic, DATE_PART('year',NOW())- DATE_PART('year',start_date) as experience  from employees limit 3;

3 Уникальный номер сотрудников - водителей

select id, surname, name_employee, patronymic  from employees e where driver_license = true;

4 Выведите номера сотрудников, которые хотя бы за 1 квартал получили оценку D или E

//ввод данных в таблицу с оценками//

INSERT INTO scores (
	employee_id,
    q1,
    q2,
    q3,
	  q4
)
VALUES
    ('2', 'D', 'C', 'A', 'D'),
    ('1', 'C', 'C', 'A', 'D'),
    ('3', 'A', 'B', 'A', 'B'),
    ('4', 'B', 'B', 'C', 'A');
    
select 	employee_id from scores where q1 in ('D','E') or q2 in ('D','E') or q3 in ('D','E') or q4 in ('D','E');

5 Выведите самую высокую зарплату в компании.
  
  select Max(salary) from employees;
  
