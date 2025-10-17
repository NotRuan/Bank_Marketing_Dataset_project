-- 7) Clientes com default = yes aceitam mais ou menos a oferta?

SELECT
	c.default_status,
	COUNT(*) AS total_clientes,
	SUM(CASE
		WHEN d.deposit = 'yes' THEN 1 ELSE 0 END) AS total_yes,
	ROUND(SUM(CASE WHEN d.deposit = 'yes' THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS tx_aceitacao
FROM clients AS c
INNER JOIN deposits AS d USING(client_id)
GROUP BY c.default_status
ORDER BY tx_aceitacao DESC;