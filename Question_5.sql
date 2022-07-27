--(Question 3 cont.) Return reverse of those department names.
--(For example => input = ‘Benefits’, output = ‘stifeneB’).
--(HINT: do not use reverse function)

WITH
v_dept     AS (SELECT DISTINCT(emp.department_id) AS deptid FROM hr.employees emp, hr.departments dept WHERE emp.department_id = dept.department_id),
v_dept2    AS (SELECT department_id AS deptid FROM hr.departments),
v_minus    AS (SELECT deptid FROM v_dept2
               MINUS
               SELECT deptid FROM v_dept),
v_deptname AS (SELECT dept.department_name dept_name FROM hr.departments dept, v_minus WHERE dept.department_id = v_minus.deptid)
SELECT dept_name, REPLACE(sys_connect_by_path(SUBSTR (dept_name, LEVEL*-1, 1), '~|'), '~|') rev_str 
FROM   v_deptname
WHERE  connect_by_isleaf = 1
CONNECT BY PRIOR dept_name = dept_name                  
           AND PRIOR SYS_GUID() IS NOT NULL 
           AND LEVEL <= LENGTH(dept_name)
ORDER BY dept_name;

---------------------------------------------
-- DEPT_NAME             REV_STR
-- Benefits              stifeneB
-- Construction          noitcurtsnoC
-- Contracting           gnitcartnoC
-- Control And Credit    tiderC dnA lortnoC
-- Corporate Tax         xaT etaroproC
-- Government Sales      selaS tnemnrevoG
-- IT Helpdesk           ksedpleH TI
-- IT Support            troppuS TI
-- Manufacturing         gnirutcafunaM
-- NOC                   CON
-- Operations            snoitarepO
-- Payroll               lloryaP
-- Recruiting            gnitiurceR
-- Retail Sales          selaS liateR
-- Shareholder Services  secivreS redloherahS
-- Treasury              yrusaerT
---------------------------------------------
