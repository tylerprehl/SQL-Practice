--EXCEPT is used to subtract a result set from
--another result set (both from queries)

--Any ORDER BY should come after both queries

SELECT
	product_id
FROM
	production.products
EXCEPT
SELECT
	product_id
FROM
	sales.order_items
ORDER BY
	product_id;
--Finds the products that have no sales
--Can only output the product_id as is because
--other cols aren't comparable (no product_name in
--sales.order_items), so I did a LEFT JOIN below
--that gets the prods with no quantity, which 
--signifies none were sold. Gets the correct result!


SELECT
	p.product_id,
	product_name
FROM
	production.products p
	LEFT JOIN sales.order_items oi
		ON p.product_id = oi.product_id
WHERE
	quantity IS NULL
GROUP BY
	p.product_id,
	p.product_name
ORDER BY
	p.product_id;
-- :D

SELECT
	unsold_prod.product_id,
	product_name
FROM 
	(
		SELECT
			product_id
		FROM
			production.products
		EXCEPT
		SELECT
			product_id
		FROM
			sales.order_items
	) unsold_prod
	INNER JOIN production.products p
		ON unsold_prod.product_id = p.product_id
ORDER BY unsold_prod.product_id;
--uses EXCEPT as a subquery to get same info



