create database demo_db;

use demo_db;

CREATE table Sales (
	cust_id INT NOT NULL,
	name VARCHAR(40),
	store_id VARCHAR(20) NOT NULL,
	bill_no INT NOT NULL,
	bill_date date primary key not null,
	amount DECIMAL(8,2) NOT NULL
);

INSERT INTO Sales VALUES
(1, 'Mike', 'S001', 101, '2015-01-02', 125.56),
(2, 'Robert', 'S003', 103, '2015-01-25', 476.50),
(3, 'Peter', 'S012', 122, '2016-02-15', 335.00),
(4, 'Joseph', 'S345', 121, '2016-03-26', 787.00),
(5, 'Harry', 'S234', 132, '2017-04-19', 678.00),
(6, 'Stephen', 'S743', 111, '2017-05-31', 864.00),
(7, 'Jacson', 'S234', 115, '2018-06-11', 762.00),
(8, 'Smith', 'S012', 125, '2019-07-24', 300.00),
(9, 'Adam', 'S456', 119, '2019-08-02', 492.20);

select * from Sales;

CREATE TABLE Sales_partition_based (
 cust_id INT NOT NULL,
 name VARCHAR(40),
 store_id VARCHAR (20) NOT NULL,
 bill_no INT NOT NULL,
 bill_date DATE PRIMARY KEY NOT NULL,
 amount DECIMAL (8,2) NOT NULL)
 PARTITION BY RANGE (year(bill_date))
 (
partition p1 VALUES LESS THAN (2016),
 partition p2 VALUES LESS THAN (2017),
 partition p3 VALUES LESS THAN (2018),
 partition p4 VALUES LESS THAN (2019),
 partition p5 VALUES LESS THAN (2020)
 );
INSERT INTO Sales_partition_based VALUES
(1, 'Mike', 'S001', 101, '2015-01-02', 125.56),
(2, 'Robert', 'S003', 103, '2015-01-25', 476.50),
(3, 'Peter', 'S012', 122, '2016-02-15', 335.00),
(4, 'Joseph', 'S345', 121, '2016-03-26', 787.00),
(5, 'Harry', 'S234', 132, '2017-04-19', 678.00),
(6, 'Stephen', 'S743', 111, '2017-05-31', 864.00),
(7, 'Jacson', 'S234', 115, '2018-06-11', 762.00),
(8, 'Smith', 'S012', 125, '2019-07-24', 300.00),
(9, 'Adam', 'S456', 119, '2019-08-02', 492.20);

select * from Sales_partition_based;

#To check information about table
SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH,
DATA_LENGTH
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_SCHEMA = 'demo_db' AND TABLE_NAME = 'Sales';

SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH,
DATA_LENGTH
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_SCHEMA = 'demo_db' AND TABLE_NAME = 'Sales_partition_based';

# partition by list 
CREATE TABLE Stores_list (
 cust_name VARCHAR(40),
 bill_no VARCHAR (20) NOT NULL,
 store_id INT PRIMARY KEY NOT NULL,
 bill_date DATE NOT NULL,
 amount DECIMAL(8,2) NOT NULL
)
PARTITION BY LIST(store_id) (
 PARTITION PEast VALUES IN (101, 103, 105),
 PARTITION PWest VALUES IN (102, 104, 106),
 PARTITION pNorth VALUES IN (107, 109, 111),
 PARTITION PSouth VALUES IN (108, 110, 112));

INSERT INTO Stores_list VALUES
( 'Mike', 'S001', 101, '2015-01-02', 125.56),
( 'Robert', 'S003', 103, '2015-01-25', 476.50),
( 'Peter', 'S012', 105, '2016-02-15', 335.00),
( 'Joseph', 'S345', 109, '2016-03-26', 787.00),
( 'Harry', 'S234', 111, '2017-04-19', 678.00),
( 'Stephen', 'S743', 102, '2017-05-31', 864.00),
( 'Jacson', 'S234', 112, '2018-06-11', 762.00),
( 'Smith', 'S012', 106, '2019-07-24', 300.00),
( 'Adam', 'S456', 104, '2019-08-02', 492.20);

SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH,
DATA_LENGTH
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_SCHEMA = 'demo_db' AND TABLE_NAME = 'Stores_list';

# Partition by HASH
CREATE TABLE Stores_hash (
cust_name VARCHAR(40),
bill_no VARCHAR (20) NOT NULL,
store_id INT PRIMARY KEY NOT NULL,
bill_date DATE NOT NULL,
amount DECIMAL(8,2) NOT NULL
)
PARTITION BY HASH(store_id)
PARTITIONS 4;

INSERT INTO Stores_hash VALUES
( 'Mike', 'S001', 101, '2015-01-02', 125.56),
( 'Robert', 'S003', 103, '2015-01-25', 476.50),
( 'Peter', 'S012', 105, '2016-02-15', 335.00),
( 'Joseph', 'S345', 109, '2016-03-26', 787.00),
( 'Harry', 'S234', 111, '2017-04-19', 678.00),
( 'Stephen', 'S743', 102, '2017-05-31', 864.00),
( 'Jacson', 'S234', 112, '2018-06-11', 762.00),
( 'Smith', 'S012', 106, '2019-07-24', 300.00),
( 'Adam', 'S456', 104, '2019-08-02', 492.20);

SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH,
DATA_LENGTH
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_SCHEMA = 'demo_db' AND TABLE_NAME = 'Stores_hash';

##########################Indexes############
CREATE TABLE `names` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `first_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
 `last_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
PRIMARY KEY (`id`)
);
INSERT INTO names VALUES (1, 'shivank', 'agrawal');
INSERT INTO names VALUES (2, 'shiva', 'agrawal');
INSERT INTO names VALUES (3, 'shi', 'agrawal');
INSERT INTO names VALUES (4, 'sh', 'agrawal');
INSERT INTO names VALUES (5, 'shivank1', 'agrawal');
INSERT INTO names VALUES (6, 'shivank', 'agrawal');

select * from names;

EXPLAIN SELECT * FROM names WHERE first_name='shivank';

#############INDEX Demo ##################
CREATE INDEX idx_first_name ON names(first_name);

SHOW INDEX from names;

EXPLAIN SELECT * FROM names WHERE first_name='shivank';

