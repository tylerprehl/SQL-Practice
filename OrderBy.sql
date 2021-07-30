SELECT first_name, last_name
FROM sales.customers
ORDER BY first_name DESC;
--options are ASC/DESC for ordering

SELECT first_name, last_name
FROM sales.customers
ORDER BY city, first_name;
--can order by unselected/multiple column(s)

SELECT city, first_name, last_name
FROM sales.customers
ORDER BY city DESC, first_name ASC;
--can descide order for each ordering col

SELECT first_name, last_name
FROM sales.customers
ORDER BY LEN(first_name) DESC;
--sorts by desc order length of first names

SELECT first_name, last_name
FROM sales.customers
ORDER BY 1, 2;
--sort by "ordinal positions of cols"
--NOT GOOD PRACTICE


