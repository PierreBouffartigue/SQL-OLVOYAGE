/* Rapport n°1 */

SELECT e.last_name ||' '|| e.first_name "Meilleurs éléments"
FROM t_employee e
JOIN t_reservation r
ON e.employee_id = r.employee_id
GROUP BY e.first_name,e.last_name
HAVING COUNT(r.employee_id) =
	(SELECT MAX(COUNT(reservation_id))
FROM t_reservation
GROUP BY employee_id);


/* Copyright Mathieu Chambaud */ 