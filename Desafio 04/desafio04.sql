-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel
SELECT p.brand,
	COUNT(f.visit_id) AS Visits
FROM sales.funnel AS f
LEFT JOIN sales.products AS p
ON f.product_id = p.product_id
GROUP BY p.brand
ORDER BY Visits DESC;

-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel
SELECT s.store_name,
	COUNT(f.visit_id) AS Visits
FROM sales.funnel AS f
LEFT JOIN sales.stores AS s
ON f.store_id = s.store_id
GROUP BY s.store_name
ORDER BY Visits DESC;

-- (Exercício 3) Identifique quantos clientes moram em cada tamanho de cidade (o porte da cidade
-- consta na coluna "size" da tabela temp_tables.regions)
SELECT region.size,
	COUNT(*) AS count
FROM sales.customers AS c
LEFT JOIN temp_tables.regions AS region
ON LOWER(c.city) = LOWER(region.city) 
	AND LOWER(c.state) = LOWER(region.state) 
GROUP BY region.size
ORDER BY count;


