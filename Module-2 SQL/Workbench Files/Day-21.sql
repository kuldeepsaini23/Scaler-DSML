CREATE database sample_august_2;

use sample_august_2;
create table customers(
	CID int auto_increment primary key,
    first_name varchar(20) not null,
    last_name varchar(20),
    age int check(age>=18),
    gender enum("M","F"),
    phone_no char(10) unique not null,
    email_id varchar(30),
    dob date,
    address varchar(100)
);
 
#Add a new column name "is_active" in customers table 
ALTER TABLE customers
ADD is_active varchar(20);

#Rename the customer table to "cust_info".
ALTER TABLE customers
RENAME TO cust_info;

#################OR##########
RENAME TABLE cust_info to customer_info;

#########################DML#####################################
select * from customers;


#change gender for customer_id =104
UPDATE customer_info
SET gender = 'M' where cust_id = 104;

#Delete the record for a customer having 'cust_id' as 103
DELETE FROM customer_info
where cust_id = 103; #also can use BEWTEEN 104 and 108

#Delete all row or all the data from a table
TRUNCATE TABLE customer_info;