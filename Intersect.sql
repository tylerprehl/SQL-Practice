--INTERSECT is the row equivalent of an INNER JOIN,
--it returns the distinct rows f/ both queries

--QUESTION - when using UNION/EXCEPT/INTERSECT, what's
--the best way to include other columns that aren't
--being compared?

SELECT
	city
FROM
	sales.customers
INTERSECT
SELECT
	city
FROM
	sales.stores
ORDER BY
	city;
--gets list of cities with both customers and stores








