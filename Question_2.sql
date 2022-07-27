--Return number of employees registered for each location.

WITH
v_loc  AS (SELECT location_id FROM hr.locations),
v_dept AS (SELECT department_id, location_id FROM hr.departments)
SELECT v_loc.location_id, COUNT(*) AS "Employees Registered"
FROM hr.employees emp,
	 v_dept,
	 v_loc
WHERE  emp.department_id = v_dept.department_id AND v_dept.location_id = v_loc.location_id
GROUP BY v_loc.location_id;

------------------------------------
-- LOCATION_ID	Employees Registered
-- 1400	        5
-- 1500	        45
-- 1700	        18
-- 1800	        2
-- 2400	        1
-- 2500	        34
-- 2700	        1
------------------------------------
