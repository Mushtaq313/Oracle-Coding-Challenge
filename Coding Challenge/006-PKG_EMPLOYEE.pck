CREATE OR REPLACE PACKAGE HR.PKG_EMPLOYEE AS

--*******************************************************************************
-- Procedure Name: P_CREATE_EMPLOYEE
-- Description:    It is used to insert employees in HR.EMPLOYEE table
-- Author:         Muhammad Mushtaq Hussain
-- Date:           24-09-2023
--
-- Parameters:
--   P_EMPLOYEE_NAME - VARCHAR2(50) - It will accept employee name and it is mandatory parameter
--   P_JOB_TITLE     - VARCHAR2(50) - It will accept job title of employee and it is mandatory parameter
--   P_MANAGER_ID    - NUMBER(10)   - It will accept manager id of employee and it is optional parameter
--   P_HIRING_DATE   - DATE         - It will accept hiring date and it is mandatory parameter
--   P_SALARY        - NUMBER(10)   - It will accept salary and it is mandatory parameter
--   P_DEPARTMENT_ID - NUMBER(5)    - It will accept DEPARTMENT and it is mandatory parameter
--   P_ACTIVE        - CHAR(1)      - It will accept employee will be active or not, It is optional parameter
--   P_STOP          - VARCHAR2     - It is out parameter and will OUT 'Y' in case of any error or exception
--   P_ALERT_TEXT    - VARCHAR2     - It is out parameter and will OUT message/alert in case of any error or exception

-- Example Usage:
/*-----------------------------------------
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
  IF P_STOP = 'Y' THEN
    DBMS_OUTPUT.PUT_LINE(P_ALERT_TEXT);
    RETURN;
  END IF;
end;
--------------------------------------------*/
-- Dependencies: DEPARTMENT_ID must exist which is foreign key of table (HR.DEPARTMENT)

  PROCEDURE P_CREATE_EMPLOYEE(P_EMPLOYEE_NAME IN HR.EMPLOYEE.EMPLOYEE_NAME%TYPE,
                              P_JOB_TITLE     IN HR.EMPLOYEE.JOB_TITLE%TYPE,
                              P_MANAGER_ID    IN HR.EMPLOYEE.MANAGER_ID%TYPE,
                              P_HIRING_DATE   IN HR.EMPLOYEE.HIRING_DATE%TYPE,
                              P_SALARY        IN HR.EMPLOYEE.SALARY%TYPE,
                              P_DEPARTMENT_ID IN HR.EMPLOYEE.DEPARTMENT_ID%TYPE,
                              P_ACTIVE        IN HR.EMPLOYEE.ACTIVE%TYPE,
                              P_STOP          OUT VARCHAR2,
                              P_ALERT_TEXT    OUT VARCHAR2);
-----------------------------------------------------------------------------------------
--*******************************************************************************
-- Procedure Name: P_SALARY_UPDATION
-- Description:    It is used to update salary of employe in HR.EMPLOYEE table
-- Author:         Muhammad Mushtaq Hussain
-- Date:           24-09-2023
--
-- Parameters:
--   P_EMPLOYEE_ID - VARCHAR2(50) - It will accept EMPLOYEE_ID and it will be used to update specific employee salary 
--                                  and if we want to update salary of whole department then it should be null
--   P_DEPARTMENT_ID - NUMBER(5)  - It will accept DEPARTMENT and it is used to update deppartment's salary instead of single employee
--   P_SAL_UPD_TYPE  - VARCHAR2(1)- 'I' will be used to increase salary on the basis of percentage
--                                - 'D' will be used to decrease salary on the basis of percentage
--                                - only 'I' and 'D' values can be passed in this parameter
--   P_PERCENTAGE    - NUMBER     - It will be used to increase/decrease salary of employee(s) on the basis of percentage
--   P_STOP          - VARCHAR2   - It is out parameter and will OUT 'Y' in case of any error or exception
--   P_ALERT_TEXT    - VARCHAR2   - It is out parameter and will OUT message/alert in case of any error or exception

-- Example Usage:
/*-----------------------------------------
  begin
  -- Call the procedure
  HR.PKG_EMPLOYEE.P_SALARY_UPDATION(P_EMPLOYEE_ID => :P_EMPLOYEE_ID,
                                 P_DEPARTMENT_ID => :P_DEPARTMENT_ID,
                                 P_SAL_UPD_TYPE => :P_SAL_UPD_TYPE,
                                 P_PERCENTAGE => :P_PERCENTAGE,
                                 P_STOP => :P_STOP,
                                 P_ALERT_TEXT => :P_ALERT_TEXT);
  IF P_STOP = 'Y' THEN
    DBMS_OUTPUT.PUT_LINE(P_ALERT_TEXT);
    RETURN;
  END IF;
end;
--------------------------------------------*/
-- Dependencies: Employee and department should exist for which salary has to be raised/decreased

  PROCEDURE P_SALARY_UPDATION(P_EMPLOYEE_ID   IN HR.EMPLOYEE.EMPLOYEE_ID%TYPE,
                              P_DEPARTMENT_ID IN HR.EMPLOYEE.DEPARTMENT_ID%TYPE,
                              P_SAL_UPD_TYPE  IN VARCHAR2, --I(INCREASE), D(DECREASE)
                              P_PERCENTAGE    IN NUMBER,
                              P_STOP          OUT VARCHAR2,
                              P_ALERT_TEXT    OUT VARCHAR2);

-----------------------------------------------------------------------------------------
--*******************************************************************************
-- Procedure Name: P_DEPARTMENT_UPDATION
-- Description:    It is used to transfer department of employe in HR.EMPLOYEE table
-- Author:         Muhammad Mushtaq Hussain
-- Date:           24-09-2023
--
-- Parameters:
--   P_EMPLOYEE_ID - VARCHAR2(50) - It will be the employee ID whose department is going to be transferred
--   P_DEPARTMENT_ID - NUMBER(5)  - It will be DEPARTMENT ID which is going to replace the existing department of table
--   P_STOP          - VARCHAR2   - It is out parameter and will OUT 'Y' in case of any error or exception
--   P_ALERT_TEXT    - VARCHAR2   - It is out parameter and will OUT message/alert in case of any error or exception

-- Example Usage:
/*-----------------------------------------
  begin
  -- Call the procedure
  HR.PKG_EMPLOYEE.P_DEPARTMENT_UPDATION(P_EMPLOYEE_ID => :P_EMPLOYEE_ID,
                                     P_DEPARTMENT_ID => :P_DEPARTMENT_ID,
                                     P_STOP => :P_STOP,
                                     P_ALERT_TEXT => :P_ALERT_TEXT);

  IF P_STOP = 'Y' THEN
    DBMS_OUTPUT.PUT_LINE(P_ALERT_TEXT);
    RETURN;
  END IF;
end;
--------------------------------------------*/
-- Dependencies: Employee should exist whose department is going to be transferred
  PROCEDURE P_DEPARTMENT_UPDATION(P_EMPLOYEE_ID   IN HR.EMPLOYEE.EMPLOYEE_ID%TYPE,
                                  P_DEPARTMENT_ID IN HR.EMPLOYEE.DEPARTMENT_ID%TYPE,
                                  P_STOP          OUT VARCHAR2,
                                  P_ALERT_TEXT    OUT VARCHAR2);

-----------------------------------------------------------------------------------------
--*******************************************************************************
-- Function Name: F_GET_EMPLOYEE_SALARY
-- Description:    This function will return salry of an employee
-- Author:         Muhammad Mushtaq Hussain
-- Date:           24-09-2023
--
-- Parameters:
--   P_EMPLOYEE_ID - VARCHAR2(50) - It will be the employee ID whose slary is going to be fetched
-- Example Usage:
/*-----------------------------------------
begin
  -- Call the function
  :result := PKG_EMPLOYEE.F_GET_EMPLOYEE_SALARY(P_EMPLOYEE_ID => :P_EMPLOYEE_ID);
end;
--------------------------------------------*/
-- Dependencies: Employee should exist whose salary is going to be fetched

  FUNCTION F_GET_EMPLOYEE_SALARY(P_EMPLOYEE_ID IN HR.EMPLOYEE.EMPLOYEE_ID%TYPE)
    RETURN HR.EMPLOYEE.SALARY%TYPE;

-----------------------------------------------------------------------------------------
--*******************************************************************************
-- Record Type: REC_EMPLOYEE
-- Description: It will be used PLSQL table for array
-- Author:         Muhammad Mushtaq Hussain
-- Date:           24-09-2023
--
  TYPE REC_EMPLOYEE IS RECORD(
    EMPLOYEE_ID   HR.EMPLOYEE.EMPLOYEE_ID%TYPE,
    EMPLOYEE_NAME HR.EMPLOYEE.EMPLOYEE_NAME%TYPE,
    JOB_TITLE     HR.EMPLOYEE.JOB_TITLE%TYPE,
    MANAGER_ID    HR.EMPLOYEE.MANAGER_ID%TYPE,
    HIRING_DATE   HR.EMPLOYEE.HIRING_DATE%TYPE,
    SALARY        HR.EMPLOYEE.SALARY%TYPE,
    DEPARTMENT_ID HR.EMPLOYEE.DEPARTMENT_ID%TYPE,
    ACTIVE        HR.EMPLOYEE.ACTIVE%TYPE);

-----------------------------------------------------------------------------------------
--*******************************************************************************
-- Array Type: TAB_EMPLOYEE_REC
-- Description: It will be used as array in Pipeline function
-- Author:         Muhammad Mushtaq Hussain
-- Date:           24-09-2023

  TYPE TAB_EMPLOYEE_REC IS TABLE OF REC_EMPLOYEE;

 -----------------------------------------------------------------------------------------
  --*******************************************************************************
  -- Pipeline Function Name: F_SHOW_DEPARTMENT_EMPLOYEES
  -- Description:    This function will return all employees of department, business logic is written here
  -- Author:         Muhammad Mushtaq Hussain
  -- Date:           24-09-2023
  --
  -- Parameters:
  --   P_DEPARTMENT_ID - VARCHAR2(50) - It will be used to extract employees of specific department whihc is used in parameter
  -- Example Usage:
  /*-----------------------------------------
SELECT * 
  FROM TABLE(HR.PKG_EMPLOYEE.F_SHOW_DEPARTMENT_EMPLOYEES(P_DEPARTMENT_ID => P_DEPARTMENT_ID));
  --------------------------------------------*/
 
  FUNCTION F_SHOW_DEPARTMENT_EMPLOYEES(P_DEPARTMENT_ID IN HR.EMPLOYEE.DEPARTMENT_ID%TYPE)
    RETURN TAB_EMPLOYEE_REC
    PIPELINED;

-----------------------------------------------------------------------------------------
--*******************************************************************************
-- Record Type: REC_DEPT_SALARY
-- Description: It will be used PLSQL table for array
-- Author:         Muhammad Mushtaq Hussain
-- Date:           24-09-2023
  TYPE REC_DEPT_SALARY IS RECORD(
    DEPARTMENT_ID   HR.EMPLOYEE.DEPARTMENT_ID%TYPE,
    DEPARTMENT_NAME HR.DEPARTMENT.DEPARTMENT_NAME%TYPE,
    TOTAL_SALARY    HR.EMPLOYEE.SALARY%TYPE);

-----------------------------------------------------------------------------------------
--*******************************************************************************
-- Array Type: TAB_EMPLOYEE_REC
-- Description: It will be used as array in Pipeline function
-- Author:         Muhammad Mushtaq Hussain
-- Date:           24-09-2023

  TYPE TAB_REC_DEPT_SALARY IS TABLE OF REC_DEPT_SALARY;

 -----------------------------------------------------------------------------------------
  --*******************************************************************************
  -- Pipeline Function Name: F_SHOW_DEPARTMENT_SALARY
  -- Description:    This function will return department cumulative salaries, if we pass department then 
                     --it will salary of specific department otherwise it will return cumulative salaries of all the departments
  -- Author:         Muhammad Mushtaq Hussain
  -- Date:           24-09-2023
  --
  -- Parameters:
  --   P_DEPARTMENT_ID - VARCHAR2(50) - It will be used to extract total salry of specific department 
                                      --or all the departments if we pass Null in this parameter
  -- Example Usage:
  /*-----------------------------------------
SELECT * 
  FROM TABLE(HR.PKG_EMPLOYEE.F_SHOW_DEPARTMENT_SALARY(P_DEPARTMENT_ID => P_DEPARTMENT_ID));
  --------------------------------------------*/
 
  FUNCTION F_SHOW_DEPARTMENT_SALARY(P_DEPARTMENT_ID IN HR.EMPLOYEE.DEPARTMENT_ID%TYPE)
    RETURN TAB_REC_DEPT_SALARY
    PIPELINED;

END PKG_EMPLOYEE;
/
CREATE OR REPLACE PACKAGE BODY HR.PKG_EMPLOYEE AS
  --*******************************************************************************
  -- Procedure Name: P_CREATE_EMPLOYEE
  -- Description:    It is used to insert employees in HR.EMPLOYEE table
  -- Author:         Muhammad Mushtaq Hussain
  -- Date:           24-09-2023
  --
  -- Parameters:
  --   P_EMPLOYEE_NAME - VARCHAR2(50) - It will accept employee name and it is mandatory parameter
  --   P_JOB_TITLE     - VARCHAR2(50) - It will accept job title of employee and it is mandatory parameter
  --   P_MANAGER_ID    - NUMBER(10)   - It will accept manager id of employee and it is optional parameter
  --   P_HIRING_DATE   - DATE         - It will accept hiring date and it is mandatory parameter
  --   P_SALARY        - NUMBER(10)   - It will accept salary and it is mandatory parameter
  --   P_DEPARTMENT_ID - NUMBER(5)    - It will accept DEPARTMENT and it is mandatory parameter
  --   P_ACTIVE        - CHAR(1)      - It will accept employee will be active or not, It is optional parameter
  --   P_STOP          - VARCHAR2     - It is out parameter and will OUT 'Y' in case of any error or exception
  --   P_ALERT_TEXT    - VARCHAR2     - It is out parameter and will OUT message/alert in case of any error or exception

  -- Example Usage:
  /*-----------------------------------------
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
    IF P_STOP = 'Y' THEN
      DBMS_OUTPUT.PUT_LINE(P_ALERT_TEXT);
      RETURN;
    END IF;
  end;
  --------------------------------------------*/
  -- Dependencies: DEPARTMENT_ID must exist which is foreign key of table (HR.DEPARTMENT)

  PROCEDURE P_CREATE_EMPLOYEE(P_EMPLOYEE_NAME IN HR.EMPLOYEE.EMPLOYEE_NAME%TYPE,
                              P_JOB_TITLE     IN HR.EMPLOYEE.JOB_TITLE%TYPE,
                              P_MANAGER_ID    IN HR.EMPLOYEE.MANAGER_ID%TYPE,
                              P_HIRING_DATE   IN HR.EMPLOYEE.HIRING_DATE%TYPE,
                              P_SALARY        IN HR.EMPLOYEE.SALARY%TYPE,
                              P_DEPARTMENT_ID IN HR.EMPLOYEE.DEPARTMENT_ID%TYPE,
                              P_ACTIVE        IN HR.EMPLOYEE.ACTIVE%TYPE,
                              P_STOP          OUT VARCHAR2,
                              P_ALERT_TEXT    OUT VARCHAR2) IS
  
  BEGIN
  
    ----Need to validate NOT NULL columns
    IF P_EMPLOYEE_NAME IS NULL THEN
      P_STOP       := 'Y';
      P_ALERT_TEXT := 'Please give P_EMPLOYEE_NAME.';
      RETURN;
    END IF;
  
    IF P_JOB_TITLE IS NULL THEN
      P_STOP       := 'Y';
      P_ALERT_TEXT := 'Please give P_JOB_TITLE.';
      RETURN;
    END IF;
  
    IF P_HIRING_DATE IS NULL THEN
      P_STOP       := 'Y';
      P_ALERT_TEXT := 'Please give P_HIRING_DATE.';
      RETURN;
    END IF;
  
    IF P_SALARY IS NULL THEN
      P_STOP       := 'Y';
      P_ALERT_TEXT := 'Please give P_SALARY.';
      RETURN;
    END IF;
  
    IF P_DEPARTMENT_ID IS NULL THEN
      P_STOP       := 'Y';
      P_ALERT_TEXT := 'Please give P_DEPARTMENT_ID.';
      RETURN;
    END IF;
  
    INSERT INTO HR.EMPLOYEE
      (EMPLOYEE_NAME,
       JOB_TITLE,
       MANAGER_ID,
       HIRING_DATE,
       SALARY,
       DEPARTMENT_ID,
       ACTIVE)
    VALUES
      (P_EMPLOYEE_NAME,
       P_JOB_TITLE,
       P_MANAGER_ID,
       P_HIRING_DATE,
       P_SALARY,
       P_DEPARTMENT_ID,
       P_ACTIVE);
  EXCEPTION
    WHEN OTHERS THEN
      P_STOP       := 'Y';
      P_ALERT_TEXT := 'Others exception occured while inserting data in HR.EMPLOYEE' ||
                      CHR(10) || SQLERRM;
      RETURN;
  END P_CREATE_EMPLOYEE;
  -----------------------------------------------------------------------------------------
  --*******************************************************************************
  -- Procedure Name: P_SALARY_UPDATION
  -- Description:    It is used to update salary of employe in HR.EMPLOYEE table
  -- Author:         Muhammad Mushtaq Hussain
  -- Date:           24-09-2023
  --
  -- Parameters:
  --   P_EMPLOYEE_ID - VARCHAR2(50) - It will accept EMPLOYEE_ID and it will be used to update specific employee salary 
  --                                  and if we want to update salary of whole department then it should be null
  --   P_DEPARTMENT_ID - NUMBER(5)  - It will accept DEPARTMENT and it is used to update deppartment's salary instead of single employee
  --   P_SAL_UPD_TYPE  - VARCHAR2(1)- 'I' will be used to increase salary on the basis of percentage
  --                                - 'D' will be used to decrease salary on the basis of percentage
  --                                - only 'I' and 'D' values can be passed in this parameter
  --   P_PERCENTAGE    - NUMBER     - It will be used to increase/decrease salary of employee(s) on the basis of percentage
  --   P_STOP          - VARCHAR2   - It is out parameter and will OUT 'Y' in case of any error or exception
  --   P_ALERT_TEXT    - VARCHAR2   - It is out parameter and will OUT message/alert in case of any error or exception

  -- Example Usage:
  /*-----------------------------------------
    begin
    -- Call the procedure
    HR.PKG_EMPLOYEE.P_SALARY_UPDATION(P_EMPLOYEE_ID => :P_EMPLOYEE_ID,
                                   P_DEPARTMENT_ID => :P_DEPARTMENT_ID,
                                   P_SAL_UPD_TYPE => :P_SAL_UPD_TYPE,
                                   P_PERCENTAGE => :P_PERCENTAGE,
                                   P_STOP => :P_STOP,
                                   P_ALERT_TEXT => :P_ALERT_TEXT);
    IF P_STOP = 'Y' THEN
      DBMS_OUTPUT.PUT_LINE(P_ALERT_TEXT);
      RETURN;
    END IF;
  end;
  --------------------------------------------*/
  -- Dependencies: Employee and department should exist for which salary has to be raised/decreased

  PROCEDURE P_SALARY_UPDATION(P_EMPLOYEE_ID   IN HR.EMPLOYEE.EMPLOYEE_ID%TYPE,
                              P_DEPARTMENT_ID IN HR.EMPLOYEE.DEPARTMENT_ID%TYPE,
                              P_SAL_UPD_TYPE  IN VARCHAR2,
                              P_PERCENTAGE    IN NUMBER,
                              P_STOP          OUT VARCHAR2,
                              P_ALERT_TEXT    OUT VARCHAR2) AS
    RESOURCE_BUSY EXCEPTION;
    PRAGMA EXCEPTION_INIT(RESOURCE_BUSY, -00054);
    --V_EMPLOYEE_ROWID ROWID;
  
  BEGIN
  
    IF NVL(P_SAL_UPD_TYPE, '$') NOT IN ('I', 'D') THEN
      P_STOP       := 'Y';
      P_ALERT_TEXT := 'Please give P_SAL_UPD_TYPE in I-> Increase, D-> Decrease';
      RETURN;
    END IF;
  
    IF P_PERCENTAGE IS NULL THEN
      P_STOP       := 'Y';
      P_ALERT_TEXT := 'Please give P_PERCENTAGE';
      RETURN;
    END IF;
  
    FOR M IN (SELECT ROWID
                FROM HR.EMPLOYEE E
               WHERE E.EMPLOYEE_ID = NVL(P_EMPLOYEE_ID, E.EMPLOYEE_ID)
                 AND E.DEPARTMENT_ID = NVL(P_DEPARTMENT_ID, E.DEPARTMENT_ID)
                 FOR UPDATE NOWAIT) LOOP
      BEGIN
      
        UPDATE HR.EMPLOYEE HE
           SET HE.SALARY = CASE
                             WHEN P_SAL_UPD_TYPE = 'I' THEN ---INCREASE PERCENTAGE
                              HE.SALARY + (HE.SALARY * P_PERCENTAGE / 100)
                             WHEN P_SAL_UPD_TYPE = 'D' THEN ---DECREASE PERCENTAGE
                              HE.SALARY - (HE.SALARY * P_PERCENTAGE / 100)
                             ELSE
                              HE.SALARY
                           END
         WHERE ROWID = M.ROWID;
      
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          P_STOP       := 'Y';
          P_ALERT_TEXT := 'Please give appropriate Employee ID';
          RETURN;
        WHEN RESOURCE_BUSY THEN
          P_STOP       := 'Y';
          P_ALERT_TEXT := 'Resource is busy while updating salary in HR.EMPLOYEE table, Please try after few seconds';
          RETURN;
        WHEN OTHERS THEN
          P_STOP       := 'Y';
          P_ALERT_TEXT := 'Others Exception occured while updating salary in HR.EMPLOYEE table' ||
                          ' - ' || SQLERRM;
          RETURN;
      END;
    END LOOP; ----M LOOP
  END P_SALARY_UPDATION;
  -----------------------------------------------------------------------------------------
  --*******************************************************************************
  -- Procedure Name: P_DEPARTMENT_UPDATION
  -- Description:    It is used to transfer department of employe in HR.EMPLOYEE table
  -- Author:         Muhammad Mushtaq Hussain
  -- Date:           24-09-2023
  --
  -- Parameters:
  --   P_EMPLOYEE_ID - VARCHAR2(50) - It will be the employee ID whose department is going to be transferred
  --   P_DEPARTMENT_ID - NUMBER(5)  - It will be DEPARTMENT ID which is going to replace the existing department of table
  --   P_STOP          - VARCHAR2   - It is out parameter and will OUT 'Y' in case of any error or exception
  --   P_ALERT_TEXT    - VARCHAR2   - It is out parameter and will OUT message/alert in case of any error or exception

  -- Example Usage:
  /*-----------------------------------------
    begin
    -- Call the procedure
    HR.PKG_EMPLOYEE.P_DEPARTMENT_UPDATION(P_EMPLOYEE_ID => :P_EMPLOYEE_ID,
                                       P_DEPARTMENT_ID => :P_DEPARTMENT_ID,
                                       P_STOP => :P_STOP,
                                       P_ALERT_TEXT => :P_ALERT_TEXT);
  
    IF P_STOP = 'Y' THEN
      DBMS_OUTPUT.PUT_LINE(P_ALERT_TEXT);
      RETURN;
    END IF;
  end;
  --------------------------------------------*/
  -- Dependencies: Employee should exist whose department is going to be transferred

  PROCEDURE P_DEPARTMENT_UPDATION(P_EMPLOYEE_ID   IN HR.EMPLOYEE.EMPLOYEE_ID%TYPE,
                                  P_DEPARTMENT_ID IN HR.EMPLOYEE.DEPARTMENT_ID%TYPE,
                                  P_STOP          OUT VARCHAR2,
                                  P_ALERT_TEXT    OUT VARCHAR2) AS
    RESOURCE_BUSY EXCEPTION;
    PRAGMA EXCEPTION_INIT(RESOURCE_BUSY, -00054);
    V_EMPLOYEE_ROWID ROWID;
  
  BEGIN
  
    IF P_EMPLOYEE_ID IS NULL THEN
      P_STOP       := 'Y';
      P_ALERT_TEXT := 'Please give P_EMPLOYEE_ID ';
      RETURN;
    END IF;
  
    IF P_DEPARTMENT_ID IS NULL THEN
      P_STOP       := 'Y';
      P_ALERT_TEXT := 'Please give P_DEPARTMENT_ID ';
      RETURN;
    END IF;
  
    BEGIN
      SELECT ROWID
        INTO V_EMPLOYEE_ROWID
        FROM HR.EMPLOYEE E
       WHERE E.EMPLOYEE_ID = P_EMPLOYEE_ID
         FOR UPDATE NOWAIT;
    
      UPDATE HR.EMPLOYEE HE
         SET HE.DEPARTMENT_ID = P_DEPARTMENT_ID
       WHERE ROWID = V_EMPLOYEE_ROWID;
    
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        P_STOP       := 'Y';
        P_ALERT_TEXT := 'Please give appropriate Employee ID';
        RETURN;
      WHEN RESOURCE_BUSY THEN
        P_STOP       := 'Y';
        P_ALERT_TEXT := 'Resource is busy while updating department id in HR.EMPLOYEE table, Please try after few seconds';
        RETURN;
      WHEN OTHERS THEN
        P_STOP       := 'Y';
        P_ALERT_TEXT := 'Others Exception occured while updating department id in HR.EMPLOYEE table' ||
                        ' - ' || SQLERRM;
        RETURN;
    END;
  
  EXCEPTION
    WHEN OTHERS THEN
      P_STOP       := 'Y';
      P_ALERT_TEXT := 'Main others exception occured while updating department id in PROCEDURE : P_DEPARTMENT_UPDATION';
      RETURN;
  END P_DEPARTMENT_UPDATION;
  -----------------------------------------------------------------------------------------
  --*******************************************************************************
  -- Function Name: F_GET_EMPLOYEE_SALARY
  -- Description:    This function will return salry of an employee
  -- Author:         Muhammad Mushtaq Hussain
  -- Date:           24-09-2023
  --
  -- Parameters:
  --   P_EMPLOYEE_ID - VARCHAR2(50) - It will be the employee ID whose slary is going to be fetched
  -- Example Usage:
  /*-----------------------------------------
  begin
    -- Call the function
    :result := PKG_EMPLOYEE.F_GET_EMPLOYEE_SALARY(P_EMPLOYEE_ID => :P_EMPLOYEE_ID);
  end;
  --------------------------------------------*/
  -- Dependencies: Employee should exist whose salary is going to be fetched

  FUNCTION F_GET_EMPLOYEE_SALARY(P_EMPLOYEE_ID IN HR.EMPLOYEE.EMPLOYEE_ID%TYPE)
    RETURN HR.EMPLOYEE.SALARY%TYPE AS
  
    V_SALARY HR.EMPLOYEE.SALARY%TYPE;
  BEGIN
    SELECT H.SALARY
      INTO V_SALARY
      FROM HR.EMPLOYEE H
     WHERE H.EMPLOYEE_ID = P_EMPLOYEE_ID;
  
    RETURN V_SALARY;
  
  EXCEPTION
    WHEN OTHERS THEN
      RETURN NULL;
  END F_GET_EMPLOYEE_SALARY;
  ----------------
  -----------------------------------------------------------------------------------------
  --*******************************************************************************
  -- Pipeline Function Name: F_SHOW_DEPARTMENT_EMPLOYEES
  -- Description:    This function will return all employees of department, business logic is written here
  -- Author:         Muhammad Mushtaq Hussain
  -- Date:           24-09-2023
  --
  -- Parameters:
  --   P_DEPARTMENT_ID - VARCHAR2(50) - It will be used to extract employees of specific department whihc is used in parameter
  -- Example Usage:
  /*-----------------------------------------
SELECT * 
  FROM TABLE(HR.PKG_EMPLOYEE.F_SHOW_DEPARTMENT_EMPLOYEES(P_DEPARTMENT_ID => P_DEPARTMENT_ID));
  --------------------------------------------*/
 
  FUNCTION F_SHOW_DEPARTMENT_EMPLOYEES(P_DEPARTMENT_ID IN HR.EMPLOYEE.DEPARTMENT_ID%TYPE)
    RETURN TAB_EMPLOYEE_REC
    PIPELINED AS
  BEGIN
  
    FOR M IN (SELECT E.EMPLOYEE_ID,
                     E.EMPLOYEE_NAME,
                     E.JOB_TITLE,
                     E.MANAGER_ID,
                     E.HIRING_DATE,
                     E.SALARY,
                     E.DEPARTMENT_ID,
                     E.ACTIVE
                FROM HR.EMPLOYEE E
               WHERE E.DEPARTMENT_ID = P_DEPARTMENT_ID) LOOP
      PIPE ROW(M);
    
    END LOOP;
  
  END F_SHOW_DEPARTMENT_EMPLOYEES;
  ---------------
 -----------------------------------------------------------------------------------------
  --*******************************************************************************
  -- Pipeline Function Name: F_SHOW_DEPARTMENT_SALARY
  -- Description:    This function will return department cumulative salaries, if we pass department then 
                     --it will salary of specific department otherwise it will return cumulative salaries of all the departments
  -- Author:         Muhammad Mushtaq Hussain
  -- Date:           24-09-2023
  --
  -- Parameters:
  --   P_DEPARTMENT_ID - VARCHAR2(50) - It will be used to extract total salry of specific department 
                                      --or all the departments if we pass Null in this parameter
  -- Example Usage:
  /*-----------------------------------------
SELECT * 
  FROM TABLE(HR.PKG_EMPLOYEE.F_SHOW_DEPARTMENT_SALARY(P_DEPARTMENT_ID => P_DEPARTMENT_ID));
  --------------------------------------------*/
 
  FUNCTION F_SHOW_DEPARTMENT_SALARY(P_DEPARTMENT_ID IN HR.EMPLOYEE.DEPARTMENT_ID%TYPE)
    RETURN TAB_REC_DEPT_SALARY
    PIPELINED AS
  BEGIN
  
    FOR M IN (SELECT E.DEPARTMENT_ID,
                     D.DEPARTMENT_NAME,
                     SUM(E.SALARY) TOTAL_SALARY
                FROM HR.EMPLOYEE E, HR.DEPARTMENT D
               WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
                 AND E.DEPARTMENT_ID = NVL(P_DEPARTMENT_ID, E.DEPARTMENT_ID)
               GROUP BY E.DEPARTMENT_ID, D.DEPARTMENT_NAME
               ORDER BY 3 DESC) LOOP
      PIPE ROW(M);
    
    END LOOP;
  
  END F_SHOW_DEPARTMENT_SALARY;

END PKG_EMPLOYEE;
/
