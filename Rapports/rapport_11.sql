SELECT t.train_id "numero du_train", d.city || '-' || a.city "Train", p.pass_name "Abonnement",
	t.price "Tarif normal", t.price - (t.price * p.discount_pct) / 100 "Tarif réduit semaine",
	t.price - (t.price * p.discount_we_pct) / 100 "Tarif réduit weekend"
FROM t_train t
JOIN t_station d
	ON t.departure_station_id = d.station_id
JOIN t_station a
	ON t.arrival_station_id = a.station_id
JOIN t_wagon_train w
	ON t.train_id = w.train_id
JOIN t_ticket tk
	ON w.wag_tr_id = tk.wag_tr_id
JOIN t_reservation r
	ON tk.reservation_id = r.reservation_id
JOIN t_customer c
	ON r.buyer_id = c.customer_id
full JOIN t_pass p
	ON c.pass_id = p.pass_id
WHERE d.city || '-' || a.city LIKE '%Paris%'
ORDER BY t.train_id;