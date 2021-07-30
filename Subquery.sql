--A Subquery is a query nested inside another
--statement such as SELECT, INSERT, UPDATE, or 
--DELETE.
--If you just need 1 value, you're better off
--using an aggregate fxn

SELECT
    order_id,
    order_date,
    customer_id
FROM
    sales.orders
WHERE
    customer_id IN ( --subquery is in parenthesis!
        SELECT
            customer_id
        FROM
            sales.customers
        WHERE
            city = 'New York'
    )
ORDER BY
    order_date DESC;
--gets order info for customers from NY
--customer_id is in both, so when selected f/
--the subquery and given WHERE city='New York', 
--it returns customer_ids where the person is f/ NY

SELECT
    product_name,
    list_price
FROM
    production.products
WHERE
    list_price > (
        SELECT
            AVG (list_price)
        FROM
            production.products
        WHERE
            brand_id IN (
                SELECT
                    brand_id
                FROM
                    production.brands
                WHERE
                    brand_name = 'Strider'
                OR brand_name = 'Trek'
            )
    )
ORDER BY
    list_price;
--you can double-nest subqueries! (up to 32 times)
--this gets product_name and list_price for items
--that have a list_price > the average of prices
--from the brands Strider and Trek

SELECT
    product_name,
    list_price
FROM
    production.products
WHERE
    list_price >= ANY (
        SELECT
            MAX (list_price)
        FROM
            production.products
        GROUP BY
            brand_id
    )
--The ANY keyword can be used to select all of 
--a certain something. This query finds the prods
--whose list prices are >= the max list price of
--ANY prod brand (if 1 case is true, becomes true).
--(in reality, list_price must only be >= the 
--lowest MAX list price)

SELECT
    product_name,
    list_price
FROM
    production.products
WHERE
    list_price >= ALL (
        SELECT
            AVG (list_price)
        FROM
            production.products
        GROUP BY
            brand_id
    )
--when using ALL, alllll values returned compared
--to the scalar expression (list_price in this
--case) must be true for the entire expression to
--evaluate to true (in reality, list_price must
--be >= the largest avg list price)

SELECT
    customer_id,
    first_name,
    last_name,
    city
FROM
    sales.customers c
WHERE
    EXISTS (
        SELECT
            customer_id
        FROM
            sales.orders o
        WHERE
            o.customer_id = c.customer_id
        AND YEAR (order_date) = 2017
    )
ORDER BY
    first_name,
    last_name;
--EXISTS returns true if any/multiple value(s)
--is(are) returned by the subquery 

SELECT
    customer_id,
    first_name,
    last_name,
    city
FROM
    sales.customers c
WHERE
    NOT EXISTS (
        SELECT
            customer_id
        FROM
            sales.orders o
        WHERE
            o.customer_id = c.customer_id
        AND YEAR (order_date) = 2017
    )
ORDER BY
    first_name,
    last_name;
--NOT EXISTS evaluates to true if no values are
--returned by the subquery

SELECT 
   AVG(order_count) average_order_count_by_staff
FROM
(
    SELECT 
	staff_id, 
        COUNT(order_id) order_count
    FROM 
	sales.orders
    GROUP BY 
	staff_id
) 
--this puts a subquery in the FROM statement to
--return a table of values that include the # of 
--orders per staff person (per staff_id), to then
--get the AVG of all staff order counts in the 
--outer-query
