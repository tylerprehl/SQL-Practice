--Correlated Subqueries are subqueries that depend 
--on the outer query for its values. They are 
--performed repeatedly (once for each row 
--evaluated by the outer query). 

SELECT
    product_name,
    list_price,
    category_id
FROM
    production.products p1
WHERE
    list_price IN (
        SELECT
            MAX (p2.list_price)
        FROM
            production.products p2
        WHERE
            p2.category_id = p1.category_id
        GROUP BY
            p2.category_id
    )
ORDER BY
    category_id,
    product_name;
--

SELECT 
	c.customer_id,
	c.last_name,
	SUM(p.list_price) AS total_order
	,COUNT(1) AS number_of_items
FROM
	sales.orders o
	INNER JOIN sales.order_items oi ON o.order_id = oi.order_id
	INNER JOIN production.products p ON oi.product_id = p.product_id
	INNER JOIN sales.customers c ON o.customer_id = c.customer_id
WHERE
	o.order_id = (SELECT MAX(o2.order_id) FROM sales.orders o2 WHERE o2.customer_id = c.customer_id)
GROUP BY 
	c.customer_id
	,c.last_name
--corellated subquery used to get the latest order_id 