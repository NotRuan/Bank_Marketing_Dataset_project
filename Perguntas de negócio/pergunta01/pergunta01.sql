-- 1) Quais profissões têm a maior taxa de aceitação de depósito?

SELECT
	c.job,
	COUNT(*) AS total_clientes,
	SUM(CASE WHEN d.deposit = 'yes' THEN 1
		ELSE 0
		END) AS total_yes,
	ROUND(AVG(CASE WHEN d.deposit = 'yes' THEN 1
		ELSE 0
		END)::numeric, 4) AS acceptance_rate
FROM deposits AS d
INNER JOIN clients AS c USING (client_id)
GROUP BY c.job
ORDER BY acceptance_rate DESC;
