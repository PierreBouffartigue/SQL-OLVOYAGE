SELECT employee_id "Numéro de l'employé", UPPER(last_name)||' '||first_name "Employé", salary + 100 ||' E' "Salaire augmenté"
FROM t_employee 
WHERE manager_id =
				(SELECT employee_id
				FROM t_employee
				WHERE manager_id IS NULL)
