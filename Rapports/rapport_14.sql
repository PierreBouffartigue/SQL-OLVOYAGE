SELECT tt.train_id || ' - '|| ts.city || ' - ' || tss.city "Nom train", sum(tw.nb_seat)-count(ttk.ticket_id) "Nombre de places disponibles"
    FROM t_train tt
    JOIN t_station ts	ON tt.departure_station_id=ts.station_id
    JOIN t_station tss	ON tt.arrival_station_id=tss.station_id
    JOIN t_wagon_train twt	ON tt.train_id=twt.train_id
    JOIN t_wagon tw	ON twt.wagon_id=tw.wagon_id
    JOIN t_ticket ttk	ON twt.wag_tr_id=ttk.wag_tr_id
WHERE twt.train_id in (select tt.train_id from t_train)
AND tt.distance > 300
AND tt.departure_time LIKE '22/05/19'
GROUP BY tt.train_id, ts.city, tss.city
ORDER BY tt.train_id;