--MERGE
--Two tables called source and target tables, need to update the target table based on the values matched f/ the source
--table. 3 cases - 1) source has some rows that don't exist, must be inserted into target, 2) target table has some rows
--that don't exist in source, must delete these rows, 3) source and target tables have a same key, but the non-key cols are
--different, must be updated
--Could use INSERT, UPDATE, DELETE, or you could use MERGE


--First lets create some tables
CREATE TABLE sales.category /*target*/ (
	category_id INT PRIMARY KEY,
	category_name VARCHAR(255) NOT NULL,
	amount DECIMAL(10, 2)
);

INSERT INTO sales.category(category_id, category_name, amount)
VALUES(1,'Children Bicycles',15000),
    (2,'Comfort Bicycles',25000),
    (3,'Cruisers Bicycles',13000),
    (4,'Cyclocross Bicycles',10000);
--SELECT * FROM sales.category;

CREATE TABLE sales.category_staging /*source*/ (
	category_id INT PRIMARY KEY,
	category_name VARCHAR(255) NOT NULL,
	amount DECIMAL(10, 2)
);

INSERT INTO sales.category_staging(category_id, category_name, amount)
VALUES(1,'Children Bicycles',15000),
    (3,'Cruisers Bicycles',13000),
    (4,'Cyclocross Bicycles',20000),
    (5,'Electric Bikes',10000),
    (6,'Mountain Bikes',10000);
--SELECT * FROM sales.category_staging;
--tables have been created, can be seen by running the SELECT FROM statements


MERGE sales.category tar /*target*/
	USING sales.category_staging src /*source*/
ON (src.category_id = tar.category_id)
WHEN MATCHED
	THEN UPDATE SET
		tar.category_name = src.category_name,
		tar.amount = src.amount
WHEN NOT MATCHED BY TARGET
	THEN INSERT (category_id, category_name, amount)
		VALUES (src.category_id, src.category_name, src.amount)
WHEN NOT MATCHED BY SOURCE
	THEN DELETE;
--merges sales.category_staging into sales.category
--note that 2 (comfort bicycles) got deleted cause it only existed in target, 3's amount got updated from 13000 to 10000,
--and 5 and 6 got added in
