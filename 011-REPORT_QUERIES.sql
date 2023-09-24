--Write a report to show all Employees for a Department
--Its Data will be fetched by using following pipeline
SELECT * 
  FROM TABLE(HR.PKG_EMPLOYEE.F_SHOW_DEPARTMENT_EMPLOYEES(P_DEPARTMENT_ID => 3));

--Write a report to show the total of Employee Salary for a Department
--Its Data will be fetched by using following pipeline
SELECT * 
  FROM TABLE(HR.PKG_EMPLOYEE.F_SHOW_DEPARTMENT_SALARY(P_DEPARTMENT_ID => NULL));
