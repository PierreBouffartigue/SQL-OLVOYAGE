SELECT employee_id "Num�ro de l'employ�", UPPER(last_name)||' '||first_name "Employ�", salary + 100 ||' E' "Salaire augment�"
FROM t_employee 
WHERE manager_id =
				(SELECT employee_id
				FROM t_employee
				WHERE manager_id IS NULL)
