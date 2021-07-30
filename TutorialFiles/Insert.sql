--INSERT
--it's actually pretty simple - just add rows

CREATE TABLE sales.promotions (
    promotion_id INT PRIMARY KEY IDENTITY (1, 1),
    promotion_name VARCHAR (255) NOT NULL,
    discount NUMERIC (3, 2) DEFAULT 0, --NUMERIC (#1, #2) holds a number with 3 digits (2 *must* be decimal places)
    start_date DATE NOT NULL,
    expired_date DATE NOT NULL
); 
--creates table with these columns/types

INSERT INTO sales.promotions (
    promotion_name,
    discount,
    start_date,
    expired_date
) OUTPUT inserted.promotion_id --can output multiple columns (use commas)
VALUES
    (
        '2018 Summer Promotion',
        0.15,
        '20180601',
        '20180901'
    )
	--, (value list 2) <--to add more values at a time
	;
--adds 1 row to the table you just created
--"inserted" is the virtual table that represents
--the row you're adding to the database


--INSERT INTO SELECT

CREATE TABLE sales.addresses (
    address_id INT IDENTITY PRIMARY KEY,
    street VARCHAR (255) NOT NULL,
    city VARCHAR (50),
    state VARCHAR (25),
    zip_code VARCHAR (5)
);   
--creates new table

INSERT /*TOP (10) [PERCENT]*/ INTO sales.addresses (street, city, state, zip_code) 
SELECT
    street,
    city,
    state,
    zip_code
FROM
    sales.customers
--could add WHERE statement if I wanted to
ORDER BY
    first_name,
    last_name; 
--Takes address info f/ sales.customers and inserts
--it into sales.addresses.
--Can use anything f/ SELECT options (WHERE, GROUP
--BY, etc) to determine what data is inserted, so 
--long as it still fits into the destination cols.
--Can determine how many rows of input I want using
--TOP or PERCENT with INSERT INTO statement.





