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

#Change the data typpe of the "is_acctive" column to INT.
ALTER TABLE customers
modify is_active INT;

#Rename the 'CID' column to 'cust_id'
ALTER TABLE customers
RENAME COLUMN CID to cust_id;

#Delete the 'adress' column from the "customers" table
ALTER TABLE customers
DROP COLUMN address;
 
#Rename the customer table to "cust_info".
ALTER TABLE customers
RENAME TO cust_info;

#################OR##########
RENAME TABLE cust_info to customer_info;

#########################DML#####################################
select * from customer_info;

#Inster the data
INSERT INTO customer_info VALUES
(102,'Jane', 'Smith', 32, 'F', '1098476253', 'jane@gmail.com', '1991-09-22', 1);
############################# OR ##############################
INSERT INTO customer_info(first_name,age,phone_no) VALUES ('Amit',35,'9876545561');
INSERT INTO customer_info(first_name,age,phone_no) VALUES ('prafull',23,'9810559290');
INSERT INTO customer_info(first_name,age,phone_no) VALUES ('Sashwath',25,'9812342');

#####ADD A CONSTRAINT TO THE "is_active" column
ALTER TABLE customer_info
ADD CONSTRAINT con CHECK(is_active IN(1,0));


#change gender for customer_id =104
UPDATE customer_info
SET gender = 'M' where cust_id = 104;

#Delete the record for a customer having 'cust_id' as 103
DELETE FROM customer_info
where cust_id = 103; #also can use BEWTEEN 104 and 108

#Delete all row or all the data from a table
TRUNCATE TABLE customer_info;


DROP TABLE customer_info;