PL/SQL Developer Test script 3.0
9
begin
  -- Call the procedure
  PKG_EMPLOYEE.P_SALARY_UPDATION(P_EMPLOYEE_ID => :P_EMPLOYEE_ID,
                                 P_DEPARTMENT_ID => :P_DEPARTMENT_ID,
                                 P_SAL_UPD_TYPE => :P_SAL_UPD_TYPE,
                                 P_PERCENTAGE => :P_PERCENTAGE,
                                 P_STOP => :P_STOP,
                                 P_ALERT_TEXT => :P_ALERT_TEXT);
end;
6
P_EMPLOYEE_ID
0
4
P_DEPARTMENT_ID
0
3
P_SAL_UPD_TYPE
1
I
5
P_PERCENTAGE
1
18
4
P_STOP
0
5
P_ALERT_TEXT
0
5
0
