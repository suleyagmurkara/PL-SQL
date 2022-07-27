--Some departments don’t have any registered employee record.
--Return 5th letter of those department names.
--(Don’t try to understand logic here because there is none. It’s just practice.)

WITH
v_dept  AS (SELECT DISTINCT(emp.department_id) AS deptid FROM hr.employees emp, hr.departments dept WHERE emp.department_id = dept.department_id),
v_dept2 AS (SELECT department_id AS deptid FROM hr.departments),
v_minus AS (SELECT deptid FROM v_dept2
            MINUS
            SELECT deptid FROM v_dept)
SELECT dept.department_id, dept.department_name, SUBSTR(dept.department_name,5,1) AS "5th letter"
FROM   hr.departments dept, v_minus
WHERE  dept.department_id = v_minus.deptid

------------------------------------------------------
-- DEPARTMENT_ID   DEPARTMENT_NAME       5th letter
-- 120	         Treasury              s
-- 130	         Corporate Tax         o
-- 140	         Control And Credit    r
-- 150	         Shareholder Services  e
-- 160	         Benefits              f
-- 170	         Manufacturing         f
-- 180	         Construction          t
-- 190	         Contracting           r
-- 200	         Operations            a
-- 210	         IT Support            u
-- 220	         NOC                   - 
-- 230	         IT Helpdesk           e
-- 240	         Government Sales      r
-- 250	         Retail Sales          i
-- 260	         Recruiting            u
-- 270	         Payroll               o
------------------------------------------------------
