--SELECT TOP allows you to limit the # of
--rows or % of rows returned. Always
--paired with ORDER BY.

--SELECT TOP (expression) [percent] [with ties]
--Expression gives a number:
--converted to float if percent is used,
--BIGINT otherwise.

--WITH TIES allows return of more rows w/
--values that match the last row.
--Ex) If you want top most expensive item,
--TOP 1 WITH TIES will return all items w/
--the most expensive price.

SELECT TOP 10 product_name, list_price
FROM production.products
ORDER BY list_price DESC;
--selects top 10 most expense items

SELECT TOP 1 PERCENT product_name, list_price
FROM production.products
ORDER BY list_price DESC;
--selects top 1% most expense items
--321 items, so 1% = 3.21, which gets
--rounded up to 4

SELECT TOP 3 WITH TIES product_name, list_price
FROM production.products
ORDER BY list_price DESC;
--gets top 3 plus any that have same price
--as the third
