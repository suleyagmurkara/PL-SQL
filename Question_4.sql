--(Question 3 cont.) Return the string between 1st letter from the end and 3th letter from the end.
--(For example => input = ‘Benefits’, output = ‘sti’).

WITH
v_dept  AS (SELECT DISTINCT(emp.department_id) AS deptid FROM hr.employees emp, hr.departments dept WHERE emp.department_id = dept.department_id),
v_dept2 AS (SELECT department_id AS deptid FROM hr.departments),
v_minus AS (SELECT deptid FROM v_dept2
            MINUS
            SELECT deptid FROM v_dept)
SELECT dept.department_id, dept.department_name, REVERSE(SUBSTR(dept.department_name,-3,3)) AS "OUTPUT"
FROM hr.departments dept, v_minus
WHERE dept.department_id = v_minus.deptid

-------------------------------------------------------
-- DEPARTMENT_ID    DEPARTMENT_NAME             OUTPUT
-- 120	            Treasury                    yru
-- 130	            Corporate Tax               xaT
-- 140	            Control And Credit          tid
-- 150	            Shareholder Services        sec
-- 160	            Benefits                    sti
-- 170	            Manufacturing               gni
-- 180	            Construction                noi
-- 190	            Contracting                 gni
-- 200	            Operations                  sno
-- 210	            IT Support                  tro
-- 220	            NOC                         CON
-- 230	            IT Helpdesk                 kse
-- 240	            Government Sales            sel
-- 250	            Retail Sales                sel
-- 260	            Recruiting                  gni
-- 270	            Payroll                     llo
-------------------------------------------------------
