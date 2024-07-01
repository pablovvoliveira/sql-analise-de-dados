-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Crie uma coluna calculada com o número de visitas realizadas por cada
-- cliente da tabela sales.customers
WITH visits AS (
	SELECT customer_id, 
		COUNT(*) AS number_of_visits
	FROM sales.funnel
	GROUP BY customer_id
)
SELECT
	c.*,
	number_of_visits
FROM sales.customers AS c
LEFT JOIN visits AS v
	ON c.customer_id = v.customer_id;