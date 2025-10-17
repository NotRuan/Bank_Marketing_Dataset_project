-- 5) Existe diferença de sucesso entre meses do ano (month)?

SELECT
    month,
	COUNT(*) AS total_contatos,
    SUM(CASE WHEN poutcome = 'success' THEN 1 ELSE 0 END) AS total_sucesso,
    ROUND(SUM(CASE WHEN poutcome = 'success' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS tx_sucesso
FROM campaigns
GROUP BY month
ORDER BY month DESC, tx_sucesso DESC;
