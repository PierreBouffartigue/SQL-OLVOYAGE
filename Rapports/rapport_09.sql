SELECT t.train_id "Numero", d.city || '-' || a.city "Nom",
	ROUND(distance/TO_NUMBER((t.arrival_time-t.departure_time))/24,0) || ' km/h' "Vitesse moyenne"
FROM T_TRAIN t
JOIN T_STATION d ON t.departure_station_id = d.station_id
JOIN T_STATION a ON t.arrival_station_id = a.station_id
ORDER BY t.train_id ASC;