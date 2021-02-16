/* -- JAIN ARCHIT HOMEWORK 6-- START--*/
DROP DATABASE Jain_ACMEOnline;

CREATE DATABASE Jain_ACMEOnline;

USE Jain_ACMEOnline;

/*table for item */
CREATE TABLE item (
Item_Number SMALLINT UNSIGNED AUTO_INCREMENT,
Item_Name VARCHAR(35) NOT NULL,
Description VARCHAR(255),
Model VARCHAR(50) NOT NULL,
Price DECIMAL(8,2) NOT NULL,
CONSTRAINT item_pk PRIMARY KEY (Item_Number));

/*CUSTOMER(CustomerID, CustomerName, Address, Email)*/
CREATE TABLE customer (
CustomerID SMALLINT UNSIGNED AUTO_INCREMENT,
CustomerName VARCHAR(50) NOT NULL,
Address VARCHAR(150) NOT NULL,
Email VARCHAR(80),
Customer_Type ENUM('Home','Business'),
CONSTRAINT customer_pk PRIMARY KEY(CustomerID));

/* -- ORDERED(, total_cost, CustomerID)*/
CREATE TABLE ordered (
OrderID SMALLINT UNSIGNED AUTO_INCREMENT,
total_cost 	 DECIMAL(10,2),
CustomerID SMALLINT UNSIGNED,
CONSTRAINT ordered_pk PRIMARY KEY (OrderID),
CONSTRAINT ordered_CustomerID_fk
FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID)
ON UPDATE CASCADE);

/*--- LINE_ITEM(Item Number, OrderID, quantity) */
CREATE TABLE line_item(
Item_Number SMALLINT UNSIGNED,
OrderID SMALLINT UNSIGNED,
quantity TINYINT UNSIGNED,
CONSTRAINT Line_item_pk PRIMARY KEY (Item_Number, OrderID),
CONSTRAINT line_item_Item_Number_fk FOREIGN KEY (Item_Number) 
REFERENCES item(Item_Number)
ON UPDATE CASCADE,
CONSTRAINT line_item_OrderID_fk FOREIGN KEY (OrderID) 
REFERENCES ordered(OrderID)
ON UPDATE CASCADE
ON DELETE CASCADE);

-- HOME(CustomerID, CreditCardNum, CardExpirationDate)
/**/
CREATE TABLE home (
CustomerID SMALLINT UNSIGNED,
CreditCardNum DECIMAL(16,0) NOT NULL,
CardExpirationDate DECIMAL(6,0) NOT NULL,
CONSTRAINT home_pk PRIMARY KEY(CustomerID),
CONSTRAINT home_CustomerID_fk
FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID)
ON UPDATE CASCADE);
---- 
/*BUSINESS(CustomerID, PaymentTerms)*/
CREATE TABLE business (
CustomerID SMALLINT UNSIGNED,
PaymentTerms VARCHAR(50) NOT NULL,	
CONSTRAINT business_pk PRIMARY KEY(CustomerID),
CONSTRAINT business_CustomerID_fk
FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID)
ON UPDATE CASCADE);

/*adding data*/

INSERT INTO item(Item_Name, Description, Model, Price)
VALUES ("Cabbage Patch Doll","Baby boy doll","Boy",39.95);

INSERT INTO item(Item_Name, Model, Price)
VALUES ("The Last Lecture","Hardcover",9.95);

INSERT INTO item(Item_Name, Description, Model, Price)
VALUES ("Keurig Beverage Maker","Keurig Platinum Edition Beverage Maker in Red","Platinum Edition",299.95);

Select * from Item;

/*modify customer table*/
ALTER TABLE customer
MODIFY COLUMN Address VARCHAR(100); 

-- Add City,State, Zipcode
ALTER TABLE customer
ADD City varchar(60);
ALTER TABLE customer
ADD State varchar(2);
ALTER TABLE customer
ADD Zipcode VARCHAR(10);

-- delete record

DELETE FROM item where item_name = "Keurig Beverage Maker";

Select * from item;
-- update record
UPDATE item SET description = 'Written by Randy Pausch' where item_name = "The Last Lecture";
Select * from item;
-- single unit insertion 
START TRANSACTION;
INSERT INTO customer (CustomerName,Address,City,State,Zipcode,Email,Customer_Type)
VALUES ("Janine Jeffers","152 Lomb Memorial Dr","Rochester","NY",14623,"jxj1234@rit.edu","Home");
INSERT INTO HOME (CustomerID,CreditCardNum,CardExpirationDate) SELECT CustomerID,1234567890123456,012014 FROM customer WHERE CustomerName="Janine Jeffers";
INSERT INTO ORDERED (OrderID,total_cost,CustomerID) SELECT 1,113.74,CustomerID FROM customer WHERE CustomerName="Janine Jeffers";
INSERT INTO line_item (Item_Number, OrderID,quantity ) VALUES (1,1,2);
INSERT INTO line_item (Item_Number, OrderID,quantity ) VALUES (2,1,3);
COMMIT;

Select * from Customer;
Select * from Home;
Select * from Ordered;
Select * from line_item;

-- END --