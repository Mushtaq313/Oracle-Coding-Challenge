----Creation of Department table in which department will be saved
CREATE TABLE HR.DEPARTMENT 
(
  DEPARTMENT_ID   NUMBER(5),
  DEPARTMENT_NAME VARCHAR2(50) NOT NULL,
  LOCATION        VARCHAR2(50) NOT NULL,
  ACTIVE          CHAR(1) DEFAULT 'Y'
);

---Adding Primary Key, it will create its unique INDEX as well automatically
ALTER TABLE HR.DEPARTMENT ADD CONSTRAINT 
PK_DEPARTMENT PRIMARY KEY (DEPARTMENT_ID);

COMMENT ON TABLE HR.DEPARTMENT IS 
'This table will save departments';
COMMENT ON COLUMN HR.DEPARTMENT.DEPARTMENT_ID IS 
'The unique identifier for the department';
COMMENT ON COLUMN HR.DEPARTMENT.DEPARTMENT_NAME IS 
'The name of the department';
COMMENT ON COLUMN HR.DEPARTMENT.LOCATION IS 
'The physical location of the department';
COMMENT ON COLUMN HR.DEPARTMENT.ACTIVE IS 
'This column will be used to in-active department instead of deletion, we just need mar its value to ''N''';
