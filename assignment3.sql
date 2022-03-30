--students table :

CREATE TABLE students(
student_id serial PRIMARY KEY,
firstname VARCHAR(30) NOT NULL,
lastname VARCHAR(30) NOT NULL, 
homeroom_number smallint,
phone VARCHAR(30) UNIQUE NOT NULL,
email VARCHAR(30) UNIQUE,
grad_year smallint);

--teachers table :
CREATE TABLE teachers(
teacher_id serial PRIMARY KEY,
firstname VARCHAR(45) NOT NULL,
lastname VARCHAR(45) NOT NULL, 
homeroom_number smallint,
department VARCHAR(45),
email VARCHAR(20) UNIQUE,
phone VARCHAR(20) UNIQUE);
