PL/SQL Developer Test script 3.0
12
begin
  -- Call the procedure
  PKG_EMPLOYEE.P_CREATE_EMPLOYEE(P_EMPLOYEE_NAME => :P_EMPLOYEE_NAME,
                                 P_JOB_TITLE => :P_JOB_TITLE,
                                 P_MANAGER_ID => :P_MANAGER_ID,
                                 P_HIRING_DATE => :P_HIRING_DATE,
                                 P_SALARY => :P_SALARY,
                                 P_DEPARTMENT_ID => :P_DEPARTMENT_ID,
                                 P_ACTIVE => :P_ACTIVE,
                                 P_STOP => :P_STOP,
                                 P_ALERT_TEXT => :P_ALERT_TEXT);
end;
9
P_EMPLOYEE_NAME
1
MUSHTAQ
5
P_JOB_TITLE
1
SYSTEM ARCHITECT
5
P_MANAGER_ID
1
90001
4
P_HIRING_DATE
1
9/1/2023
12
P_SALARY
1
80000
4
P_DEPARTMENT_ID
1
2
3
P_ACTIVE
1
Y
5
P_STOP
0
5
P_ALERT_TEXT
0
5
0
