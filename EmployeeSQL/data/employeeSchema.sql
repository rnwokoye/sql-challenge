-- Titles Table
CREATE TABLE Title (
    title_id VARCHAR(20)   NOT NULL,
    title VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_Title PRIMARY KEY (
        title_id
     )
);

-- Salaries TAble
CREATE TABLE Salary (
    emp_no INT   NOT NULL,
    salary Money   NOT NULL,
    CONSTRAINT pk_Salary PRIMARY KEY (
        emp_no
     )
);

-- Employees Table
CREATE TABLE Employee (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR(20)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(255)   NOT NULL,
    last_name VARCHAR(255)   NOT NULL,
    sex char   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_Employee PRIMARY KEY (
        emp_no
     )
);

-- Managers Table
CREATE TABLE Dept_Manager (
    dept_mgr_id SERIAL   NOT NULL,
    dept_no VARCHAR(20)   NOT NULL,
    emp_no INT   NOT NULL,
    CONSTRAINT pk_Dept_Manager PRIMARY KEY (
        dept_mgr_id
     )
);

-- Department employees Table
CREATE TABLE Dept_Employee (
    dept_emp_id SERIAL   NOT NULL,
    emp_no INT   NOT NULL,
    dep_no VARCHAR(20)   NOT NULL,
    CONSTRAINT pk_Dept_Employee PRIMARY KEY (
        dept_emp_id
     )
);

-- Departments Table
CREATE TABLE Department (
    dept_no VARCHAR(20)   NOT NULL,
    dept_name VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_Department PRIMARY KEY (
        dept_no
     )
);

ALTER TABLE Salary ADD CONSTRAINT fk_Salary_emp_no FOREIGN KEY(emp_no)
REFERENCES Employee (emp_no);

ALTER TABLE Employee ADD CONSTRAINT fk_Employee_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Title (title_id);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Department (dept_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employee (emp_no);

ALTER TABLE Dept_Employee ADD CONSTRAINT fk_Dept_Employee_emp_no FOREIGN KEY(emp_no)
REFERENCES Employee (emp_no);

ALTER TABLE Dept_Employee ADD CONSTRAINT fk_Dept_Employee_dep_no FOREIGN KEY(dep_no)
REFERENCES Department (dept_no);


