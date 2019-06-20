SELECT COUNT(ti.ticket_id), t.train_id d.city depart, a.city arrive
FROM t_ticket ti
JOIN t_wagon_train w
	ON tk.wag_tr_id = w.wag_tr_id
JOIN t_train t
	ON t.train_id = w.train_id
JOIN t_station d
	ON d.station_id = t.departure_station_id
JOIN t_station a
	ON t.arrival_station_id = a.station_id
ORDER BY max(ti.ticket_id) DESC LIMIT 0,5