--Return all employees who earns the highest salary in each department.
--(Hint: use analytic functions)

WITH
highest_salary AS (SELECT department_id, MAX(salary) AS maxsal FROM hr.employees GROUP BY department_id)
SELECT emp.department_id,
       emp.first_name || ' ' || emp.last_name AS "EMPLOYEE NAME", 
       emp.salary
FROM hr.employees emp,
     highest_salary hsal
WHERE emp.department_id = hsal.department_id AND emp.salary = hsal.maxsal
ORDER BY emp.department_id;

-------------------------------------------------
-- DEPARTMENT_ID    EMPLOYEE NAME	    SALARY
-- 10	            Jennifer Whalen	    4400
-- 20	            Michael Hartstein       13000
-- 30	            Den Raphaely	    11000
-- 40	            Susan Mavris	    6500
-- 50	            Adam Fripp	            8200
-- 60	            Alexander Hunold	    9000
-- 70	            Hermann Baer	    10000
-- 80	            John Russell	    14000
-- 90	            Steven King	            24000
-- 100	            Nancy Greenberg	    12008
-- 110	            Shelley Higgins	    12008
-------------------------------------------------
