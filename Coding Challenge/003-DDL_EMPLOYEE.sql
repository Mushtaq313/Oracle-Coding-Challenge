----Creation of Employee table in which employees will be saved
CREATE TABLE HR.EMPLOYEE  
(
  EMPLOYEE_ID     NUMBER(10),
  EMPLOYEE_NAME   VARCHAR2(50) NOT NULL,
  JOB_TITLE       VARCHAR2(50) NOT NULL,
  MANAGER_ID      NUMBER(10),
  HIRING_DATE     DATE NOT NULL,
  SALARY          NUMBER(10) NOT NULL,
  DEPARTMENT_ID   NUMBER(5) NOT NULL,
  ACTIVE          CHAR(1) DEFAULT 'Y'
);

---Adding Primary Key, it will create its unique INDEX as well automatically
ALTER TABLE HR.EMPLOYEE ADD CONSTRAINT 
PK_EMPLOYEE PRIMARY KEY (EMPLOYEE_ID);

---Adding Foreign Key
ALTER TABLE HR.EMPLOYEE ADD CONSTRAINT 
FK_EMPLOYEE FOREIGN KEY (DEPARTMENT_ID) REFERENCES HR.DEPARTMENT (DEPARTMENT_ID) ;

----Foreign Key Index is required
CREATE INDEX HR.IDX_EMP_01 ON HR.EMPLOYEE(DEPARTMENT_ID);

COMMENT ON TABLE HR.EMPLOYEE IS 
'This table will save employees';
COMMENT ON COLUMN HR.EMPLOYEE.EMPLOYEE_ID IS 
'The unique identifier for the employee';
COMMENT ON COLUMN HR.EMPLOYEE.EMPLOYEE_NAME IS 
'The name of the employee';
COMMENT ON COLUMN HR.EMPLOYEE.JOB_TITLE IS 
'The job role undertaken by the employee. Some employees may undertaken the same job role';
COMMENT ON COLUMN HR.EMPLOYEE.MANAGER_ID IS 
'Line manager of the employee';
COMMENT ON COLUMN HR.EMPLOYEE.HIRING_DATE IS 
'The date the employee was hired';
COMMENT ON COLUMN HR.EMPLOYEE.SALARY IS 
'Current salary of the employee';
COMMENT ON COLUMN HR.EMPLOYEE.DEPARTMENT_ID IS 
'Each employee must belong to a department';
COMMENT ON COLUMN HR.EMPLOYEE.ACTIVE IS 
'This column will be used to in-active employees instead of deletion, we just need mark its value to ''N''';

-----It will be used to tag Employee ID on creating new employee through trigger
create sequence HR.EMPLOYEE_SEQ
start with 90000
increment by 1
nocache;
