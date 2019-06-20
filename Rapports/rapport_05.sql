/* Rapport n°5 */ 

SELECT t.train_id "Train",
       d.city || TO_CHAR(t.departure_time, ' (DD/MM/YY HH24:MI) ') || ' – ' || a.city || TO_CHAR(t.arrival_time, ' (DD/MM/YY HH24:MI) ') "Trajet",
       t.distance "Distance",
       t.price || 'e' "Prix initial"
FROM t_train t
JOIN t_station d ON t.departure_station_id = d.station_id
JOIN t_station a ON t.arrival_station_id = a.station_id
ORDER BY t.train_id;

/* Copyright Mathieu Chambaud */ 