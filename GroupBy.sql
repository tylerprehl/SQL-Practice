--GROUP BY allows you ato arrange the rows of a
--query in groups, determined by the columns you
--specify

--Aggregate fxns are the normal use for groups, 
--because they perform a calculation on groups to
--return a value
--examples: COUNT, SUM, AVG, MIN, MAX

--Note that you can't include other columns that
--aren't included in the groups UNLESS they're 
--used for an aggregate fxn b/c otherwise there
--is no guarantee they'll just have one value for
--any given group.


SELECT
    customer_id,
    YEAR (order_date) order_year
FROM
    sales.orders
WHERE
    customer_id IN (1, 2)
ORDER BY
    customer_id;
--example query (note id 1 had 2 orders in 2018)

SELECT
    customer_id,
    YEAR (order_date) order_year
FROM
    sales.orders
WHERE
    customer_id IN (1, 2)
GROUP BY
	customer_id,
	YEAR (order_date)
ORDER BY
    customer_id;
--uses GROUP BY to cut out duplicates
--note that DISTINCT by year would've done the
--same thing

SELECT
    city,
    COUNT (customer_id) customer_count
FROM
    sales.customers
GROUP BY
    city
ORDER BY
    city;
--uses COUNT on customer_id to produce cust_cnt,
--but groups and orders by city

SELECT
    brand_name, --comes f/ brands
    MIN (list_price) min_price, --comes f/ products
    MAX (list_price) max_price --comes f/products
FROM
    production.products p
INNER JOIN production.brands b ON b.brand_id = p.brand_id
WHERE
    model_year = 2018
GROUP BY
    brand_name
ORDER BY
    brand_name;
--using MIN and MAX
--INNER JOIN to get products associated to their brands

SELECT
    order_id,
    SUM (
        quantity * list_price * (1 - discount)
    ) net_value
FROM
    sales.order_items
GROUP BY
    order_id;
--example using SUM




