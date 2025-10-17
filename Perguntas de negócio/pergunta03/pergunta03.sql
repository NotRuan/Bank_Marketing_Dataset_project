-- 3) Clientes com empréstimo imobiliário (housing) ou pessoal (loan) têm maior ou menor probabilidade de aceitar?

-- ==============================================
-- Análise com 2 CTEs + UNION ALL 
-- ==============================================
WITH housing_cte AS (
  SELECT
    c.housing AS category,
    COUNT(*) AS total_contacts,
    SUM(CASE WHEN d.deposit = 'yes' THEN 1 ELSE 0 END) AS total_yes,
    ROUND(AVG(CASE WHEN d.deposit = 'yes' THEN 1 ELSE 0 END)::numeric, 4) AS tx_aceitacao
  FROM clients c
  JOIN deposits d USING (client_id)
  WHERE c.housing IN ('yes','no')
  GROUP BY c.housing
),

loan_cte AS (
  SELECT
    c.loan AS category,
    COUNT(*) AS total_contacts,
    SUM(CASE WHEN d.deposit = 'yes' THEN 1 ELSE 0 END) AS total_yes,
    ROUND(AVG(CASE WHEN d.deposit = 'yes' THEN 1 ELSE 0 END)::numeric, 4) AS tx_aceitacao
  FROM clients c
  JOIN deposits d USING (client_id)
  WHERE c.loan IN ('yes','no')
  GROUP BY c.loan
)

SELECT 'housing' AS tipo, category, total_contacts, total_yes, tx_aceitacao
FROM housing_cte
UNION ALL
SELECT 'loan' AS tipo, category, total_contacts, total_yes, tx_aceitacao
FROM loan_cte
ORDER BY tipo, tx_aceitacao DESC;

-- ==============================================
-- Análise com 1 SELECT + CASES 
-- ==============================================

SELECT
	CASE
		WHEN c.housing = 'yes' AND c.loan = 'yes' THEN 'Ambos'
		WHEN c.housing = 'yes' AND c.loan = 'no' THEN 'Apenas Housing'
		WHEN c.housing = 'no' AND c.loan = 'yes' THEN 'Apeans Loan'
		ELSE 'Nenhum'
		END AS tipo_cliente,
	COUNT(*) AS total_contacts,
	SUM(CASE
			WHEN d.deposit = 'yes' THEN 1
				ELSE 0 END) AS total_yes,
	ROUND(AVG(CASE 
				WHEN d.deposit = 'yes' THEN 1
		  			ELSE 0 END)::numeric, 4) AS tx_aceitacao
FROM deposits AS d
INNER JOIN clients AS c USING (client_id)
GROUP BY tipo_cliente
ORDER BY tx_aceitacao DESC;