--UNION combines tables *vertically* (where JOIN
--adds/filters columns to a table, UNION adds rows)
--If using ORDER BY, comes after whole UNION statement

SELECT
	first_name,
	last_name
FROM
	sales.staffs
UNION
SELECT
	first_name,
	last_name
FROM
	sales.customers;
--combines names of staff and customers into 1 list








