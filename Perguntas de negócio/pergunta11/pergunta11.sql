-- Taxa de conversão por número de contatos (campaign) — clientes que recebem mais ligações convertem melhor?

WITH contato_cliente AS (
		SELECT
			c.client_id,
			ca.campaign AS qnt_contato,
			d.deposit
		FROM clients AS c
		INNER JOIN deposits AS d USING (client_id)
		INNER JOIN campaigns AS ca USING (campaign_id)
		ORDER BY qnt_contato DESC
),

desempenho_volume AS(
		SELECT
			qnt_contato,
			COUNT(*) AS total_clientes,
			SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS total_sucesso,
		ROUND(SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS tx_sucesso
		FROM contato_cliente
		GROUP BY qnt_contato
)

SELECT *
FROM desempenho_volume
ORDER BY qnt_contato ASC;