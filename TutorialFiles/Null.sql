--NULL and 3 Valued Logic
--Null represents the absence of data. In
--an expression that returns true/false,
--if the "piece of data" acted on is Null,
--then it returns as Unknown.
--** Note: Null != Null 

SELECT 
	customer_id,
	first_name,
	last_name,
	phone
FROM sales.customers
WHERE
	phone = NULL
ORDER BY
	first_name,
	last_name;
--supposed to get all rows where phone is
--null, but fails cause when NULL = NULL in
--the WHERE clause, it returns as UNKNOWN

SELECT 
	customer_id,
	first_name,
	last_name,
	phone
FROM sales.customers
WHERE
	phone IS NULL
ORDER BY
	first_name,
	last_name;
--uses IS NULL instead, succeeds

SELECT 
	customer_id,
	first_name,
	last_name,
	phone
FROM sales.customers
WHERE
	phone IS NOT NULL
ORDER BY
	first_name,
	last_name;
--check for IS NOT NULL instead this time
--returns all rows w/ a value for phone


