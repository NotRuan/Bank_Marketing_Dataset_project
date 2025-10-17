WITH faixa_etaria AS (
    SELECT
        client_id,
        CASE
            WHEN age BETWEEN 18 AND 25 THEN '18-25'
            WHEN age BETWEEN 26 AND 30 THEN '26-30'
            WHEN age BETWEEN 31 AND 35 THEN '31-35'
            WHEN age BETWEEN 36 AND 40 THEN '36-40'
            WHEN age BETWEEN 41 AND 45 THEN '41-45'
            WHEN age BETWEEN 46 AND 55 THEN '46-55'
            WHEN age BETWEEN 56 AND 60 THEN '56-60'
            ELSE '60+' 
        END AS fx_etaria,
        balance
    FROM clients
),

canal_sucesso AS (
    SELECT
        f.fx_etaria,
        ca.contact,
        COUNT(DISTINCT d.client_id) AS total_clientes,
        SUM(CASE WHEN d.deposit = 'yes' THEN 1 ELSE 0 END) AS total_sucesso,
        ROUND(SUM(CASE WHEN d.deposit = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT d.client_id), 2) AS tx_sucesso,
        ROUND(AVG(f.balance), 2) AS media_saldo
    FROM deposits AS d
    INNER JOIN campaigns AS ca USING(campaign_id)
    INNER JOIN faixa_etaria AS f USING(client_id)
    GROUP BY f.fx_etaria, ca.contact
)

SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY fx_etaria ORDER BY tx_sucesso DESC) AS rn
    FROM canal_sucesso
) AS ranked
WHERE rn = 1
ORDER BY fx_etaria;