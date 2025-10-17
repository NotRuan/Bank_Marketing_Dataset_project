-- 2) Qual é a faixa etária que mais aceita a oferta de depósito?

WITH faixa_etaria AS (
	SELECT 
		client_id,
		CASE
			WHEN age BETWEEN 18 AND 25 THEN '18-25'
			WHEN age BETWEEN 26 AND 35 THEN '26-35'
			WHEN age BETWEEN 36 AND 45 THEN '36-45'
			WHEN age BETWEEN 46 AND 60 THEN '46-60'
			ELSE '60+'
		END AS fx_etaria
	FROM clients
),

tx_aceitacao AS (
	SELECT
		c.client_id,
		SUM(CASE WHEN d.deposit = 'yes' THEN 1 ELSE 0 END) AS total_yes,
		ROUND(AVG(CASE WHEN d.deposit = 'yes' THEN 1 ELSE 0 END)::numeric, 4) AS tx_aceitacao
	FROM deposits AS d
	INNER JOIN clients AS c USING (client_id)
	GROUP BY c.client_id
)

SELECT
	f.fx_etaria,
	ROUND(AVG(t.tx_aceitacao)::numeric, 4) AS avg_aceitacao
FROM faixa_etaria AS f
INNER JOIN tx_aceitacao AS t USING (client_id)
GROUP BY f.fx_etaria
ORDER BY avg_aceitacao DESC;