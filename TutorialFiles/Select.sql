SELECT *
FROM sales.customers
WHERE state = 'CA';
--selects all f/ customers w/ state=CA
--FROM>>WHERE>>SELECT

SELECT *
FROM sales.customers
WHERE state = 'CA'
ORDER BY first_name;
--add in an ORDER BY first name
--WHERE still applies
--FROM>>WHERE>>SELECT>>ORDER BY

SELECT city, COUNT(*)
FROM sales.customers
WHERE state = 'CA'
GROUP BY city
ORDER BY city;
--COUNT(*) is a count of rows w/ same city
--GROUP BY combines rows into groups
  -->picky about other selects if grouped
--FROM>>WHERE>>GROUP BY>>SELECT>>ORDER BY

SELECT city, COUNT(*)
FROM sales.customers
WHERE state = 'CA'
GROUP BY city
HAVING COUNT(*) > 10
ORDER BY city;
--WHERE filters rows, HAVING filters groups




