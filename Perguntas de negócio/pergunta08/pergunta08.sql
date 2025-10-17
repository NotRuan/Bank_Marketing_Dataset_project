-- 8) Qual nível de escolaridade está mais associado a aceitar depósitos?

SELECT
	c.education,
	COUNT(d.deposit_id) AS total_deposito
FROM deposits AS d
INNER JOIN clients AS c USING (client_id)
WHERE d.deposit = 'yes'
GROUP BY c.education
ORDER BY total_deposito DESC;