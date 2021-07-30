--AND and OR

--When using AND:
--TRUE and FALSE = UNKNOWN
--FALSE and FALSE = FALSE
--TRUE and TRUE = TRUE

--When using OR:
--TRUE or TRUE = TRUE
--TRUE or FALSE = TRUE
--TRUE or UNKNOWN = TRUE
--FALSE or FALSE = FALSE
--FALSE or UNKNOWN = UNKNOWN
--UNKNOWN or UNKNOWN = UNKOWN

--(unknowns come into play when dealing w/
--NULLs)

SELECT
    *
FROM
    production.products
WHERE
    brand_id = 1
OR  brand_id = 2
AND list_price > 1000
ORDER BY
    brand_id DESC;
--SQL evaluates AND first, then OR
--(there are prods w/ price < 1000)

SELECT
    *
FROM
    production.products
WHERE
    (brand_id = 1 OR  brand_id = 2)
AND list_price > 1000
ORDER BY
    brand_id DESC;
--parenthesis denote that OR happens first
--(all prods have price > 1000)

SELECT
    product_name,
    brand_id
FROM
    production.products
WHERE
    brand_id = 1
OR brand_id = 2
OR brand_id = 4
ORDER BY
    brand_id DESC;
--multiple ORs example
--can be replaced by using IN...

SELECT
    product_name,
    brand_id
FROM
    production.products
WHERE
    brand_id IN (1, 2, 3)
ORDER BY
    brand_id DESC;
--produces same result as prev query



