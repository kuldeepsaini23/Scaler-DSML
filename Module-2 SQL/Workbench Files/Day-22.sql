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