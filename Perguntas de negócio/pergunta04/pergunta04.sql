-- 4) Qual canal de contato (cellular ou telephone) tem maior taxa de sucesso?

SELECT
    contact AS canal,
    SUM(CASE WHEN poutcome = 'success' THEN 1 ELSE 0 END) AS total_sucesso,
    ROUND(SUM(CASE WHEN poutcome = 'success' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS tx_sucesso
FROM campaigns
GROUP BY contact
ORDER BY tx_sucesso DESC;