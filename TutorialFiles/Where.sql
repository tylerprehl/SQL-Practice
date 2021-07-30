--WHERE is used to get rows f/ the table 
--that satisfy one or more conditions

--Three types of results - true, false, or
--unknown. Will only return rows that get
--"true" from all conditions

SELECT 
	product_id,
	product_name,
	category_id,
	model_year,
	list_price
FROM
	production.products
WHERE
	category_id = 1
ORDER BY list_price DESC;
--gets all prods w/ category id of 1

SELECT 
	product_id,
	product_name,
	category_id,
	model_year,
	list_price
FROM
	production.products
WHERE
	category_id = 1 AND model_year = 2018
ORDER BY list_price DESC;
--gets all prods w/ cat_id of 1 AND model year 2018

SELECT
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
FROM
    production.products
WHERE
    list_price > 300 AND model_year = 2018
ORDER BY
    list_price DESC;
--gets prods with price>300 and model year 2018

SELECT
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
FROM
    production.products
WHERE
    list_price > 3000 OR model_year = 2018
ORDER BY
    list_price DESC;
--gets prods with price>300 OR model year 2018

SELECT
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
FROM
    production.products
WHERE
    list_price BETWEEN 1899.00 AND 1999.99
ORDER BY
    list_price DESC;
--gets prods with 1899<price<1999.99
--Uses BETWEEN_AND combo

SELECT
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
FROM
    production.products
WHERE
    list_price IN (299.99, 369.99, 489.99)
ORDER BY
    list_price DESC;
--gets prods with price of any in the IN list

SELECT
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
FROM
    production.products
WHERE
    product_name LIKE '%Cruiser%'
ORDER BY
    list_price DESC;
--uses LIKE operator to get products w/
--"Cruiser" in the name (I'm assuming the 
--% signs allow for other things on either
--side of the word "Cruiser")
