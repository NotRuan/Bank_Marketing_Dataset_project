-- 06) Qual a duração média da ligação que resulta em depósito?

WITH depositos AS(
	SELECT
		c.duration
	FROM deposits AS d
	INNER JOIN campaigns AS c
	USING (campaign_id)
	WHERE d.deposit = 'yes'
)

SELECT
	COUNT(*) AS total_deposito,
	ROUND(AVG(duration), 2) AS duracao_media
FROM depositos;