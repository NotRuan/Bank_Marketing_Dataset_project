WITH perfil_cliente AS (
	SELECT
		CASE
			WHEN c.age BETWEEN 18 AND 25 THEN '18-25'
			WHEN c.age BETWEEN 26 AND 30 THEN '26-30'
			WHEN c.age BETWEEN 31 AND 35 THEN '31-35'
			WHEN c.age BETWEEN 36 AND 40 THEN '36-40'
			WHEN c.age BETWEEN 41 AND 45 THEN '41-45'
			WHEN c.age BETWEEN 46 AND 55 THEN '46-55'
			WHEN c.age BETWEEN 56 AND 60 THEN '56-60'
			ELSE '60+' 
		END AS fx_etaria,
		CASE
			WHEN c.housing = 'yes' AND c.loan = 'yes' THEN 'Ambos'
			WHEN c.housing = 'yes' AND c.loan = 'no' THEN 'Apenas housing'
			WHEN c.housing = 'no' AND c.loan = 'yes' THEN 'Apenas Loan'
			ELSE 'Nenhum empréstimo' 
		END AS emprestimo,
		SUM(CASE WHEN d.deposit = 'yes' THEN 1 ELSE 0 END) AS total_deposito,
		ROUND(SUM(CASE WHEN d.deposit = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS tx_aceitacao
	FROM clients AS c
	INNER JOIN deposits AS d USING(client_id)
	GROUP BY fx_etaria, emprestimo
	ORDER BY fx_etaria ASC
),

media_saldo AS (
    SELECT
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
        ROUND(AVG(balance), 2) AS media_saldo
    FROM clients
    GROUP BY fx_etaria
    ORDER BY fx_etaria ASC
)

SELECT
	pc.fx_etaria,
	pc.emprestimo,
	ms.media_saldo,
	pc.total_deposito,
	pc.tx_aceitacao
FROM perfil_cliente AS pc
INNER JOIN media_saldo AS ms USING(fx_etaria)
ORDER BY pc.fx_etaria ASC;