--CTE
--CTE is useful for reporting and hierarchal data.


WITH cte_sales_amounts (staff, sales, year) 
AS (
    SELECT    
        first_name + ' ' + last_name, 
        SUM(quantity * list_price * (1 - discount)),
        YEAR(order_date)
    FROM    
        sales.orders o
    INNER JOIN sales.order_items i ON i.order_id = o.order_id
    INNER JOIN sales.staffs s ON s.staff_id = o.staff_id
    GROUP BY 
        first_name + ' ' + last_name,
        year(order_date)
)
SELECT
    staff, 
    sales,
	year
FROM 
    cte_sales_amounts
WHERE
    staff = 'Genna Serrano' AND
	year = 2018;





--Recursive CTE
--Where normal CTE's are generally used for creating
--virtual tables to query from for reporting, Recursive
--CTE's are more so for quering hierarchal data.

WITH cte_numbers(n, weekday) 
AS (
    SELECT 
        0, 
        DATENAME(DW, 0)
    UNION ALL
    SELECT    
        n + 1, 
        DATENAME(DW, n + 1)
    FROM    
        cte_numbers
    WHERE n < 6
)
SELECT 
    n, weekday
FROM 
    cte_numbers;
--just creates the weekdays in order

WITH cte_org AS (
    SELECT       
        staff_id, 
        first_name,
        manager_id
        
    FROM       
        sales.staffs
    WHERE manager_id IS NULL
    UNION ALL
    SELECT 
        e.staff_id, 
        e.first_name,
        e.manager_id
    FROM 
        sales.staffs e
        INNER JOIN cte_org o 
            ON o.staff_id = e.manager_id
)
SELECT * FROM cte_org
ORDER BY cte_org.staff_id;
--EXACT use case (hierarchal data)







