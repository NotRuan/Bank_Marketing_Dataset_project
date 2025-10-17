-- Clientes com histórico de campanhas anteriores (poutcome) têm maior chance de aceitar em campanhas atuais?

WITH historico_cliente AS (
    SELECT
        c.client_id,
        COUNT(*) - 1 AS total_campanhas_anteriores,
        SUM(CASE WHEN d.deposit = 'yes' THEN 1 ELSE 0 END) - 
            CASE WHEN MAX(CASE WHEN d.deposit = 'yes' THEN 1 ELSE 0 END) = 1 THEN 1 ELSE 0 END AS total_sucesso_anteriores
    FROM clients AS c
    INNER JOIN deposits AS d USING(client_id)
    INNER JOIN campaigns AS ca USING(campaign_id)
    GROUP BY c.client_id
),

campanha_atual AS (
    SELECT DISTINCT ON (c.client_id)
        c.client_id,
        d.deposit AS resultado_atual
    FROM clients AS c
    INNER JOIN deposits AS d USING(client_id)
    INNER JOIN campaigns AS ca USING(campaign_id)
    ORDER BY c.client_id, ca.campaign_id DESC
)

SELECT
    h.client_id,
    h.total_campanhas_anteriores,
    h.total_sucesso_anteriores,
    ca.resultado_atual
FROM historico_cliente AS h
INNER JOIN campanha_atual AS ca USING(client_id)
ORDER BY h.total_sucesso_anteriores DESC;