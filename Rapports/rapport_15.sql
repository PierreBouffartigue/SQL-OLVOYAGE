SELECT distinct count(tr.reservation_id) "Reservation", LPAD(upper(te.last_name)||' '||te.first_name, LENGTH(te.last_name||' '||te.first_name)
+(LEVEL*3)-3, '_') "Employer", te.employee_id num_employe
FROM t_employee te
    LEFT OUTER JOIN  t_reservation tr
        ON te.employee_id=tr.employee_id
START WITH manager_id = (select employee_id from t_employee where manager_id IS NULL)
CONNECT BY PRIOR tr.employee_id=manager_id
GROUP BY LPAD(upper(te.last_name)||' '||te.first_name, LENGTH(te.last_name||' '||te.first_name)+(LEVEL*3)-3, '_'), te.employee_id
ORDER by te.employee_id;