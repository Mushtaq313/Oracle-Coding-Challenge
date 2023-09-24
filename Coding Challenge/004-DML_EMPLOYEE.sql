insert into HR.EMPLOYEE (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITLE, MANAGER_ID, HIRING_DATE, SALARY, DEPARTMENT_ID, ACTIVE)
values (90001, 'John Smith', 'CEO', null, to_date('01-01-1995', 'dd-mm-yyyy'), 100000, 1, 'Y');

insert into HR.EMPLOYEE (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITLE, MANAGER_ID, HIRING_DATE, SALARY, DEPARTMENT_ID, ACTIVE)
values (90002, 'Jimmy Willis', 'Manager', 90001, to_date('23-09-2003', 'dd-mm-yyyy'), 52500, 4, 'Y');

insert into HR.EMPLOYEE (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITLE, MANAGER_ID, HIRING_DATE, SALARY, DEPARTMENT_ID, ACTIVE)
values (90003, 'Roxy Jones', 'Salesperson', 90002, to_date('02-11-2017', 'dd-mm-yyyy'), 35000, 4, 'Y');

insert into HR.EMPLOYEE (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITLE, MANAGER_ID, HIRING_DATE, SALARY, DEPARTMENT_ID, ACTIVE)
values (90004, 'Selwyn Field', 'Salesperson', 90003, to_date('20-05-2015', 'dd-mm-yyyy'), 32000, 4, 'Y');

insert into HR.EMPLOYEE (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITLE, MANAGER_ID, HIRING_DATE, SALARY, DEPARTMENT_ID, ACTIVE)
values (90005, 'David Hallett ', 'Engineer', 90006, to_date('17-04-2018', 'dd-mm-yyyy'), 40000, 2, 'Y');

insert into HR.EMPLOYEE (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITLE, MANAGER_ID, HIRING_DATE, SALARY, DEPARTMENT_ID, ACTIVE)
values (90006, 'Sarah Phelps', 'Manager', 90001, to_date('21-03-2015', 'dd-mm-yyyy'), 45000, 2, 'Y');

insert into HR.EMPLOYEE (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITLE, MANAGER_ID, HIRING_DATE, SALARY, DEPARTMENT_ID, ACTIVE)
values (90007, 'Louise Harper', 'Engineer', 90006, to_date('01-01-2013', 'dd-mm-yyyy'), 47000, 2, 'Y');

insert into HR.EMPLOYEE (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITLE, MANAGER_ID, HIRING_DATE, SALARY, DEPARTMENT_ID, ACTIVE)
values (90008, 'Tina Hart', 'Engineer', 90009, to_date('28-07-2014', 'dd-mm-yyyy'), 45000, 3, 'Y');

insert into HR.EMPLOYEE (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITLE, MANAGER_ID, HIRING_DATE, SALARY, DEPARTMENT_ID, ACTIVE)
values (90009, 'Gus Jones', 'Manager', 90001, to_date('15-05-2018', 'dd-mm-yyyy'), 50000, 3, 'Y');

insert into HR.EMPLOYEE (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITLE, MANAGER_ID, HIRING_DATE, SALARY, DEPARTMENT_ID, ACTIVE)
values (90010, 'Mildred Hall', 'Manager', 90001, to_date('12-10-1996', 'dd-mm-yyyy'), 35000, 1, 'Y');

COMMIT;