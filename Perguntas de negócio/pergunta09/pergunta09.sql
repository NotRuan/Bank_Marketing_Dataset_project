-- Existe algum perfil de cliente pouco explorado (muitos contatos, pouca conversão)?

-- Análise de faixa de idades / financeiro

WITH perfil_cliente AS (
		SELECT
			client_id,
			CASE
            	WHEN age BETWEEN 18 AND 23 THEN '18-23'
            	WHEN age BETWEEN 24 AND 29 THEN '24-29'
           	 	WHEN age BETWEEN 30 AND 35 THEN '30-35'
           	 	WHEN age BETWEEN 36 AND 45 THEN '36-45'
            	WHEN age BETWEEN 46 AND 56 THEN '46-56'
				WHEN age BETWEEN 57 AND 60 THEN '57-69'
            	ELSE '60+' END AS fx_etaria, 
				balance
		FROM clients
),

efetividade AS (
		SELECT
			p.fx_etaria,
		COUNT(*) AS total_clientes,
		SUM(CASE WHEN d.deposit = 'yes' THEN 1 ELSE 0 END) AS total_deposito,
		ROUND(AVG(CASE WHEN d.deposit = 'yes' THEN 1 ELSE 0 END)::numeric / COUNT(*), 4) AS tx_conversao,
		ROUND(AVG(p.balance)::numeric, 2) AS media_balance
		FROM perfil_cliente AS p
		INNER JOIN deposits AS d USING (client_id)
		GROUP BY fx_etaria
)

SELECT *
FROM efetividade
ORDER BY tx_conversao DESC;
