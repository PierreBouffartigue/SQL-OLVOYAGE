/* Rapport n°6 */ 

SELECT *
FROM(SELECT COUNT(employee_id)  " NOMBRE EMPLOYES" 
    FROM T_EMPLOYEE),
    (SELECT COUNT(customer_id) " NOMBRE ACHETEURS"
    FROM T_CUSTOMER),
    (SELECT COUNT(customer_id) " NOMBRE ABONNES "
    FROM T_CUSTOMER
    WHERE pass_id IS NOT NULL
    AND ADD_MONTHS(pass_date,12) >= SYSDATE),
    (SELECT COUNT(train_id) " NOMBRE TRAINS "
    FROM T_TRAIN),
    (SELECT COUNT(station_id) " NOMBRE STATIONS "
    FROM T_STATION),
    (SELECT COUNT(reservation_id) " NOMBRE RESERVATIONS "
    FROM T_RESERVATION),
    (SELECT((SELECT COUNT(customer_id)
    from T_CUSTOMER
    WHERE ADD_MONTHS(pass_date,12)>=SYSDATE)/(SELECT COUNT(customer_id)
    FROM t_CUSTOMER)*100) " % "
    FROM (SELECT COUNT(customer_id)
    FROM T_CUSTOMER))


/* Copyright Mathieu Chambaud */