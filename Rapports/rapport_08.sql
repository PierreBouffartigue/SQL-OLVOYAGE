SELECT UPPER(last_name) || ' ' || INITCAP(first_name) AS "Clients sans abonnement", adress
FROM t_customer
WHERE pass_id IS NULL
ORDER BY UPPER(last_name) || ' ' || INITCAP(first_name);