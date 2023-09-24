PL/SQL Developer Test script 3.0
7
begin
  -- Call the procedure
  HR.PKG_EMPLOYEE.P_DEPARTMENT_UPDATION(P_EMPLOYEE_ID => :P_EMPLOYEE_ID,
                                     P_DEPARTMENT_ID => :P_DEPARTMENT_ID,
                                     P_STOP => :P_STOP,
                                     P_ALERT_TEXT => :P_ALERT_TEXT);
end;
4
P_EMPLOYEE_ID
1
90001
4
P_DEPARTMENT_ID
1
4
3
P_STOP
0
5
P_ALERT_TEXT
0
5
0
