--GROUPING SETS

SELECT * FROM sales.sales_summary
ORDER BY
	brand,
	category,
	model_year;
--just returns all info from sales_summary table

--In this table, there are 4 possible groupings:
--(brand, category) - returns sales by both
--(brand) - returns sales of just the brand
--(category) - returns sales of just the category
--() - returns total sales

SELECT
	brand,
	category,
	SUM (sales) sales
FROM
	sales.sales_summary
GROUP BY
	GROUPING SETS (
		(brand, category),
		(brand),
		(category),
		()
	)
ORDER BY
	brand,
	category;
--returns allll the groups :D

SELECT
    GROUPING(brand) grouping_brand,
    GROUPING(category) grouping_category,
    brand,
    category,
    SUM (sales) sales
FROM
    sales.sales_summary
GROUP BY
    GROUPING SETS (
        (brand, category),
        (brand),
        (category),
        ()
    )
ORDER BY
    brand,
    category;
--GROUPING produces a 1 or 0 based on if it was
--grouped or not, which allows for logic in other
--places (pay attention to where the NULLs are and
--how they can be identified by the 1s and 0s)

--CUBE is used to generate GROUPING SETS based on
--your input columns (generates all combos of what
--you give it)
--Note - I didn't put in an example of CUBE cause 
--Jeff said it's useless ;)


SELECT
    brand,
    category,
    SUM (sales) sales
FROM
    sales.sales_summary
GROUP BY
    ROLLUP(brand, category);
--ROLLUP is similar to cube in that it generates
--GROUPING SETS, but it does so in a pyramid manner
--(it cuts off just one column for each generated
--GROUPING SET)
--The hierarchy is such that the first listed col
--is the last one to be left out of the grouping
--Note - it gets an example cause Jeff loves it :)



