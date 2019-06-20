SELECT ti.ticket_id num_billet, upper(c.last_name)||' '|| c.first_name "Clients -25ans", depart.city ||' '||'('||
	to_char(t.departure_time, 'DD/MM/YYY HH24:MI')||')' || ' - ' || arrive.city ||' '|| '('||
	to_char(t.arrival_time,'DD/MM/YYYY HH24:MI')||')' as "Trajet du train"
FROM t_train t
	JOIN t_station depart	ON depart.station_id = t.departure_station_id
	JOIN t_station arrive	ON arrive.station_id = t.arrival_station_id
	JOIN t_wagon_train w	ON t.train_id = w.train_id
	JOIN t_wagon wa	ON w.wagon_id = wa.wagon_id
	JOIN t_ticket ti	ON w.wag_tr_id = ti.wag_tr_id
	JOIN t_reservation r	ON ti.reservation_id = r.reservation_id
	JOIN t_customer c	ON r.buyer_id = c.customer_id
WHERE wa.class_type = 1
	AND TRUNC((SYSDATE - birth_date)/365, 0) < 25
	AND departure_time BETWEEN '15/04/2019' AND '25/01/2019'
	AND r.creation_date BETWEEN t.departure_time - 20 AND t.departure_time
ORDER BY r.creation_date;