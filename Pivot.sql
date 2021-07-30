--PIVOT
--"Rotates data 90 degrees"
--flips columns to rows/rows to columns

SELECT 
    category_name, 
    COUNT(product_id) product_count
FROM 
    production.products p
    INNER JOIN production.categories c 
        ON c.category_id = p.category_id
GROUP BY 
    category_name;
-- normie query

SELECT * FROM (
    SELECT 
        category_name, 
        product_id,
		model_year
    FROM 
        production.products p
        INNER JOIN production.categories c 
            ON c.category_id = p.category_id
) t
PIVOT(
    COUNT(product_id) 
    FOR category_name IN (
        [Children Bicycles], 
        [Comfort Bicycles], 
        [Cruisers Bicycles], 
        [Cyclocross Bicycles], 
        [Electric Bikes], 
        [Mountain Bikes], 
        [Road Bikes])
) AS pivot_table
ORDER BY
	model_year;
--creates table with column headers that would've
--previously been row groups



DECLARE @categories NVARCHAR(MAX) = '';
DECLARE @command NVARCHAR(MAX) = '';
SELECT --select category names
	@categories += QUOTENAME(category_name) + ','
FROM production.categories;
SET @categories = LEFT(@categories, LEN(@categories)-1); --removes the last comma

--construct dynamic SQL
SET @command=' 
SELECT * FROM (
    SELECT 
        category_name, 
        product_id,
		model_year
    FROM 
        production.products p
        INNER JOIN production.categories c 
            ON c.category_id = p.category_id
) t
PIVOT(
    COUNT(product_id) 
    FOR category_name IN (
			' + @categories + '
		)
) AS pivot_table
ORDER BY
	model_year';

EXECUTE sp_executesql @command;
--Basically creates a list of categories by running an
--initial query to get the category names, then there
--is another query written to actually produce the pivot
--effect, but it's written as a string and groups by 
--the list of categories you produced from the initial
--query. Then the string is run as a query with EXECUTE
--sp_executesql 

