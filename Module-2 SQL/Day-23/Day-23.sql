select demo_db.add(250);

select demo_db.add(id) as id, 
	first_name, 
	last_name 
from names;

-- Let’s say the company’s financial year starts as :
-- • Oct-Dec 22, then
-- • Jan-Mar 23, then
-- • Apr-Jun 23 and
-- • Jul-Sep 23
Select *
from customer_purchases
where customer_id=7
And year(date_add(market_date, interval 3 month))=2019;
-- Do you see a problem here?
-- For every year you have to change the year and rewrite this query again
-- and again.
Select *
from customer_purchases
where customer_id=7
And get_fiscal_year(market_date)=2019;

#########Procedures###############

-- Question: Let’s say we want to assign some badge to the customers
-- based on their total purchase amount in a particular fiscal year.
-- • If the total purchase amount is greater than 250, the customer
-- gets a Gold badge.
-- • Otherwise (purchase amount is less than 250) he/she gets a
-- Silver badge.get_customer_levelget_customer_levelget_customer_level


#After creating Procedureget_customer_level
-- • Click on Apply.
-- • Refresh your Database Schema
-- • Go to the Stored Procedure
-- • Click the ⚡icon on the right side
-- • Provide input to your Stored Procedure
