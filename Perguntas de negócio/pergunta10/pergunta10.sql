-- 10) Qual é a taxa de conversão geral do dataset?

SELECT
    SUM(CASE WHEN d.deposit = 'yes' THEN 1 ELSE 0 END) AS total_yes,
    ROUND(
        SUM(CASE WHEN d.deposit = 'yes' THEN 1 ELSE 0 END)::numeric / COUNT(*),
        4
    ) AS tx_conversao
FROM deposits AS d;