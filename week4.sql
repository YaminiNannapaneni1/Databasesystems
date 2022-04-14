Insert Statements
--Inserting record into Orders_table with the values mentioned
INSERT INTO orders_table (order_Id,Customer_Id,
Product_Details,order_Type,STATUS,Total_order_Discount,Total_order_Price,Total,Transaction_ID) 
VALUES(4,1,'{"ID": 10,"QTY": 20,"cost": 100,"Sub_total": 2000}','card','Waiting for pickup',100.0,2000.0,1900.0,4)
--Inserting record into transactions_table with the values mentioned
INSERT INTO transactions_table (Transactions_Id, Shop_Id, Transaction_Type,Time,Customer_Id)
VALUES (4,4,'COD', '2010-05-23 10:40:00',1);
--Inserting record into shop_table with the values mentioned
INSERT INTO shop_table ( Shop_Id, Shop_Name,Type,Start_date,End_date)
VALUES (4,'loreal_paris','cosmetics', '2010-05-23','2022-04-10');

Delete STATEMENT
--Delete records from orders_table where order_id = 4
DELETE FROM orders_table WHERE order_Id = 4;

Update Statement 
--Update shop_table field end_date to the value given where shop_id as mentioned.
UPDATE shop_table SET End_date = '2022-04-10' WHERE Shop_Id = 4;
--Update customer_table field middle_name as mentioned when customer_id field is equal to value given.
UPDATE customer_table SET Middle_Name = 'Alex' WHERE Customer_id = 2;


Simple SELECT
--select all fields from customer_table
SELECT * FROM  customer_table ;

Join Statements
--Joins customer_table with transactions_table on customer_id
SELECT c.Customer_id,c.First_Name,c.age,c.Mobile,c.Email,
t.Shop_Id,t.Transaction_Type FROM customer_table c JOIN transactions_table t 
ON c.Customer_id = t.Customer_id
--Joins orders_table with transactions_table on Transactions_Id
SELECT o.*,t.Shop_Id,t.Time FROM orders_table o JOIN transactions_table t 
ON o.Transaction_ID = t.Transactions_Id

summary statements 
--Get the Total smount spend by the customer.
SELECT o.Customer_Id,sum(o.Total) AS Total_purchase_By_Customer
 FROM orders_table o  GROUP BY o.Customer_Id
 --get the total number of TRANSACTION done in the shop.
 SELECT t.Shop_Id,count(t.Transactions_Id) AS Total_transcations_per_shop
 FROM transactions_table t  GROUP BY t.Shop_Id
--get the different types of orders 
 SELECT count(o.order_Id) AS count_order_type,o.order_Type 
FROM orders_table o GROUP BY o.order_Type

Multi table query
--get the details from customer_table,transactions_table,orders_table
 SELECT  c.Customer_id,c.First_Name,c.age,c.Mobile,c.Email,
t.Shop_Id,t.Transaction_Type,o.order_Id,o.Product_Details FROM customer_table c JOIN transactions_table t 
ON c.Customer_id = t.Customer_id
JOIN  orders_table o ON o.Transaction_ID = t.Transactions_Id
