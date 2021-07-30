--SELECT DISTINCT is for getting only
--distinct values in a specified column;
--it removes duplicates...AAAAAAAAARRRRRRRRRRRRRRRRRRRRRGGGGGGGGGGGGGGGGGGGGHHHHHHHHHHHHHHHHHHHHHHHHHAHSDGFASDKFGLASDLKFASDKLVNASDKLFNSDKLFASDKLFKNASDFKLNASDKLFGNASDLFGNASDKLNFASDKLNFASD

--"Uses the combo of values in all 
--specified cols in the SELECT list to 
--evaluate uniqueness".
--If applied to a col w/ NULLs, will keep 
--1 NULL and eliminate the others.

SELECT city
FROM sales.customers
ORDER BY city;
--selects city f/ customers, orders alphabetically
--there are duplicate cities

SELECT DISTINCT city
FROM sales.customers
ORDER BY city;
--cuts out duplicates

SELECT city, state
FROM sales.customers
ORDER BY city, state;
--returns all cities and their respective states

SELECT DISTINCT city, state
FROM sales.customers;
--gets all distinct city and states
--note that it gets ordered by city

SELECT DISTINCT city, state
FROM sales.customers
ORDER BY state;
--gets all distinct city and states
--ordered 1st by state, then city

SELECT DISTINCT phone
FROM sales.customers
ORDER BY phone;
--example with NULL values (1 NULL returned)

SELECT city, state, zip_code
FROM sales.customers
GROUP BY city, state, zip_code
ORDER BY city, state, zip_code;
--GROUP BY equivalent to...

SELECT DISTINCT city, state, zip_code
FROM sales.customers;
--much nicer  :)
--GROUP BY is better used when you want to
--apply and aggregate fxn to one or more
--columns.



