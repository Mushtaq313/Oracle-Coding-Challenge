PL/SQL Developer Test script 3.0
4
begin
  -- Call the function
  :result := PKG_EMPLOYEE.F_GET_EMPLOYEE_SALARY(P_EMPLOYEE_ID => :P_EMPLOYEE_ID);
end;
2
result
1
115000
4
P_EMPLOYEE_ID
1
90001
4
0
