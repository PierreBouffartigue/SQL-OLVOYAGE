SELECT COUNT (c.customer_id) "Nombre d'abonnés correspondant"
FROM t_customer c
JOIN t_pass p
	ON c.pass_id = p.pass_id
JOIN t_reservation r
	ON c.customer_id = r.buyer_id
JOIN t_ticket tk
	ON r.buyer_id = tk.ticket_id
JOIN t_wagon_train w
	ON tk.wag_tr_id = w.wag_tr_id
JOIN t_train t
	ON w.train_id = t.train_id
WHERE p.pass_name = 'Senior'
AND to_char(t.departure_time, 'month') LIKE 'mars%'
AND to_char(t.departure_time, 'yyyy') LIKE '2017';