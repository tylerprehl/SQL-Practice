--OFFSET and FETCH are used to limit the
--# of rows returned; options of the ORDER
--BY clause.

--OFFSET specifies the # of rows to skip
--before starting to return rows f/ the
--query. Can be constant, variable, or 
--parameter that is >=0.
--OFFSET [row count] [ROW | ROWS]

--FETCH specifies the # of rows to return
--after the OFFSET clause has been 
--processed. Can be constant, variable, or
--scalar that is >=1.
--FETCH NEXT [row count] [ROW | ROWS] ONLY

SELECT product_name, list_price
FROM production.products
ORDER BY list_price, product_name;
--simply returns products f/cheap->teuer

SELECT product_name, list_price
FROM production.products
ORDER BY list_price, product_name
OFFSET 10 ROWS;
--skip the first 10 rows

SELECT product_name, list_price
FROM production.products
ORDER BY list_price, product_name
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;
--skip 1st 10 rows, get next 10

SELECT product_name, list_price
FROM production.products
ORDER BY list_price DESC, product_name
OFFSET 0 ROWS --required to FETCH anything
FETCH NEXT 10 ROWS ONLY;
--get 10 most expense items


