Create Database Black_friday_sale;

Use Black_friday_sale;

CREATE TABLE black_friday_data (
    User_ID INT NOT NULL,
    Product_ID VARCHAR(50) NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('M','F')),
    Age VARCHAR(10),
    Occupation INT,
    City_Category CHAR(1) CHECK (City_Category IN ('A','B','C')),
    Stay_In_Current_City_Years VARCHAR(5),
    Marital_Status INT CHECK (Marital_Status IN (0,1)),
    Product_Category_1 INT,
    Product_Category_2 FLOAT,
    Product_Category_3 FLOAT,
    Purchase INT NOT NULL CHECK (Purchase > 0)
);

ALTER TABLE black_friday_data
ADD PRIMARY KEY (User_ID, Product_ID);

SELECT DATABASE();

USE Black_friday_sale;

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:\Program Files\MySQL\MySQL Server 8.0\Black Friday Data.csv'
INTO TABLE black_friday_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE 'C:\Users\ASHISH\Downloads\DATA Analyst\Black Friday Data.csv'
INTO TABLE black_friday_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Select * from black_friday_data;

SHOW TABLES;

SELECT SUM(Purchase) AS Total_Sales
FROM black_friday_data;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

SELECT COUNT(*) FROM black_friday_data;
SELECT * FROM black_friday_data LIMIT 5;

CREATE TABLE total_transactions AS
SELECT COUNT(*) AS total_transactions
FROM black_friday_data;

SELECT * FROM total_transactions;


CREATE TABLE distinct_customers AS
SELECT COUNT(DISTINCT User_ID) AS total_customers
FROM black_friday_data;

SELECT * FROM distinct_customers;

CREATE TABLE distinct_products AS
SELECT COUNT(DISTINCT Product_ID) AS total_products
FROM black_friday_data;

SELECT * FROM distinct_products;
