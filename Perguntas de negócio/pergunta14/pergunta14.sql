-- 13) Ranking dos 10 clientes com maior potencial de conversão (saldo + histórico de aceitação).

WITH historico AS (
	SELECT
		c.client_id,
		COUNT(*) AS total_interacoes,
		SUM(CASE WHEN d.deposit = 'yes' THEN 1 ELSE 0 END) AS total_depositos
	FROM clients AS c
	INNER JOIN deposits AS d USING (client_id)
	GROUP BY c.client_id
)
SELECT 
	h.client_id,
	c.balance,
	h.total_depositos,
	ROUND((h.total_depositos * 10) + (c.balance / 1000), 2)AS score_potencial
FROM historico AS h
INNER JOIN clients AS c USING(client_id)
ORDER BY score_potencial DESC
LIMIT 10;