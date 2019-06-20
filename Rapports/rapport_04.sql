/* Rapport n°4 */

SELECT r.reservation_id "Num de Reser",
       r.creation_date "Date",
       e.last_name ||' '|| e.first_name "Employe",
       c.last_name ||' '|| c.first_name "Acheteur"      
FROM t_reservation r
JOIN t_employee e ON r.employee_id = e.employee_id
JOIN t_customer c ON r.buyer_id = c.customer_id
WHERE(r.creation_date) =
        (SELECT MIN(creation_date)
FROM t_reservation);

/* Copyright Mathieu Chambaud */ 