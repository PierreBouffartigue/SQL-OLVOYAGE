/* Rapport n°2 */ 

SELECT c.last_name ||' '|| c.first_name "Acheteur sans billets"
FROM t_customer c
JOIN t_reservation r 
ON c.customer_id = r.buyer_id
JOIN t_ticket t 
ON r.reservation_id = t.reservation_id
WHERE c.customer_id != t.customer_id;


/* Copyright Mathieu Chambaud */ 