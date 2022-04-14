--Created Customer_Table with following attributes and syntax
 
CREATE TABLE `Customer_Table` ( 
`Customer_id` INT NULL, 
`First_Name` VARCHAR(50) NULL DEFAULT NULL, 
`Middle_Name` VARCHAR(50) NULL DEFAULT NULL, 
`Last_Name` VARCHAR(50) NULL DEFAULT NULL, 
`Age` INT NULL, `Gender` VARCHAR(50) NULL DEFAULT NULL, 
`Mobile` VARCHAR(50) NULL DEFAULT NULL, 
 
`Email` VARCHAR(50) NULL DEFAULT NULL, 
`Address` VARCHAR(50) NULL DEFAULT NULL, 
 
 
CONSTRAINT ID PRIMARY KEY (Customer_id) 
); 

--Created Orders_Table with following attributes and syntax
CREATE TABLE `Orders_Table` ( 
`order_Id` INT NULL, 
`Customer_Id` INT NULL, 
`Product_Details` LONGTEXT NULL, 
`order_Type` VARCHAR(50) NULL DEFAULT NULL, 
`Status` VARCHAR(50) NULL DEFAULT NULL, 
`Total_order_Discount` FLOAT NULL DEFAULT NULL, 
`Total_order_Price` FLOAT NULL DEFAULT NULL, 
`Total` FLOAT NULL DEFAULT NULL, 
`Transaction_ID` INT NULL, 
CONSTRAINT ID PRIMARY KEY (order_Id) 
) 
COLLATE='utf8mb3_general_ci' 

--Created Transactions_Table with following attributes and syntax
CREATE TABLE `Transactions_Table` ( 
`Transactions_Id` INT NULL, 
`Shop_Id` INT NULL, 
`Transaction_Type` VARCHAR(50) NULL DEFAULT NULL, 
`Time` TIMESTAMP NULL, `Customer_Id` INT NULL, 
 
CONSTRAINT ID PRIMARY KEY (Transactions_Id) 
 
) 
COLLATE='utf8mb3_general_ci' 


--Created Product_Table with following attributes and syntax
 
CREATE TABLE `Product_table` ( 
`Product_Id` INT NULL, 
`Shop_Id` INT NULL, 
`Title` VARCHAR(50) NULL DEFAULT NULL, 
`Price` FLOAT NULL DEFAULT NULL, 
`Discount` FLOAT NULL DEFAULT NULL, 
`Quantity` INT NULL DEFAULT NULL, 
CONSTRAINT ID PRIMARY KEY (Product_Id) 
 
) 
COLLATE='utf8mb3_general_ci' 
; 


--Created Shop_Table with following attributes and syntax

CREATE TABLE `Shop_Table` ( 
`Shop_Id` INT NULL, 
`Shop_Name` VARCHAR(50) NULL DEFAULT NULL, 
`Type` VARCHAR(50) NULL DEFAULT NULL, 
`Start_date` DATE NULL, 
`End_date` DATE NULL, 
 
CONSTRAINT ID PRIMARY KEY (Shop_Id) 
) 
COLLATE='utf8mb3_general_ci' 
;

--Making Transactions_ID as Foreign key 
ALTER TABLE `orders_table` 
ADD CONSTRAINT `FK_orders_table_transactions_table` FOREIGN KEY (`Transaction_ID`) REFERENCES `transactions_table` (`Transactions_Id`) ON UPDATE NO ACTION ON DELETE NO ACTION; 

--Making Shop_ID as Foreign key 
ALTER TABLE `product_table` 
ADD CONSTRAINT `FK_product_table_shop_table` FOREIGN KEY (`Shop_Id`) REFERENCES `shop_table` (`Shop_Id`) ON UPDATE NO ACTION ON DELETE NO ACTION; 
ALTER TABLE `transactions_table` 
 
ADD CONSTRAINT `FK_transactions_table_shop_table` FOREIGN KEY (`Shop_Id`) REFERENCES `shop_table` (`Shop_Id`) ON UPDATE NO ACTION ON DELETE NO ACTION; 

;


