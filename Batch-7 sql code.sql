CREATE DATABASE Online_Shoppings_s;
USE Online_Shoppings_s; 
CREATE TABLE CUSTOMER (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(100)
);

INSERT INTO CUSTOMER VALUES
(1,'Rahul Sharma','rahul@gmail.com','9999999999','Hyderabad'),
(2,'Priya Reddy','priya@gmail.com','9876543210','Vijayawada'),
(3,'Arjun Kumar','arjun@gmail.com','9876543211','Guntur'),
(4,'Sneha Rao','sneha@gmail.com','9876543212','Warangal'),
(5,'Kiran Kumar','kiran@gmail.com','9876543213','Hyderabad'),
(6,'Anjali Singh','anjali@gmail.com','9876543214','Visakhapatnam');


CREATE TABLE ADMIN (
    Admin_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100),
    Password VARCHAR(50)
);

INSERT INTO ADMIN (Admin_ID, Name, Email, Password) VALUES
(1, 'Admin One', 'admin1@gmail.com', 'admin123'),
(2, 'Admin Two', 'admin2@gmail.com', 'admin456'),
(3, 'Admin Three', 'admin3@gmail.com', 'admin789'),
(4, 'Admin Four', 'admin4@gmail.com', 'admin101'),
(5, 'Admin Five', 'admin5@gmail.com', 'admin202');

SELECT * FROM ADMIN;
USE OnlineShopping;

DROP TABLE IF EXISTS PRODUCT;

CREATE TABLE PRODUCT (
    Product_ID INT PRIMARY KEY,
    Category_ID INT,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT
);

INSERT INTO PRODUCT VALUES
(1,1,'Smartphone',20000.00,50),
(2,1,'Laptop',55000.00,20),
(3,2,'Kurti',1200.00,40),
(4,3,'DBMS Book',500.00,30),
(5,4,'Mixer Grinder',3500.00,15),
(6,5,'Face Cream',800.00,25);




CREATE TABLE CATEGORY (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(50)
);

INSERT INTO CATEGORY VALUES
(1,'Electronics'),
(2,'Clothing'),
(3,'Books'),
(4,'Home Appliances'),
(5,'Beauty');


USE OnlineShopping;

DROP TABLE IF EXISTS SHOPPING_CART;

CREATE TABLE SHOPPING_CART (
    Cart_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Quantity INT
);

INSERT INTO SHOPPING_CART VALUES
(1,1,1,1),
(2,2,3,2),
(3,3,4,1),
(4,4,5,1),
(5,5,6,2),
(6,6,2,1);


USE OnlineShopping;

DROP TABLE IF EXISTS `ORDER`;

CREATE TABLE `ORDER` (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Total_Amount DECIMAL(10,2),
    Status VARCHAR(30)
);

INSERT INTO `ORDER` VALUES
(1,1,'2026-09-10',20000.00,'Delivered'),
(2,2,'2026-09-11',2400.00,'Shipped'),
(3,3,'2026-09-12',500.00,'Delivered'),
(4,4,'2026-09-13',3500.00,'Processing'),
(5,5,'2026-09-14',1600.00,'Delivered'),
(6,6,'2026-09-15',55000.00,'Shipped');




DROP TABLE IF EXISTS PAYMENT;

CREATE TABLE PAYMENT (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT,
    Payment_Method VARCHAR(30),
    Payment_Date DATE,
    Amount DECIMAL(10,2)
);

INSERT INTO PAYMENT VALUES
(1,1,'UPI','2026-09-10',20000.00),
(2,2,'Credit Card','2026-09-11',2400.00),
(3,3,'Cash on Delivery','2026-09-12',500.00),
(4,4,'UPI','2026-09-13',3500.00),
(5,5,'Debit Card','2026-09-14',1600.00),
(6,6,'UPI','2026-09-15',55000.00);


CREATE TABLE DELIVERY (
    Delivery_ID INT PRIMARY KEY,
    Order_ID INT,
    Status VARCHAR(30)
);

INSERT INTO DELIVERY VALUES
(1,1,'Delivered'),
(2,2,'Shipped'),
(3,3,'Delivered'),
(4,4,'Processing'),
(5,5,'Delivered'),
(6,6,'Shipped');




CREATE TABLE SUPPLIER (
    Supplier_ID INT PRIMARY KEY,
    Supplier_Name VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

INSERT INTO SUPPLIER VALUES
(1,'ABC Suppliers','9000000001','abc@gmail.com'),
(2,'XYZ Suppliers','9000000002','xyz@gmail.com'),
(3,'Global Suppliers','9000000003','global@gmail.com'),
(4,'Prime Suppliers','9000000004','prime@gmail.com'),
(5,'Smart Suppliers','9000000005','smart@gmail.com');



CREATE TABLE REVIEW (
    Review_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Rating INT,
    Comment VARCHAR(200)
);

INSERT INTO REVIEW VALUES
(1,1,1,5,'Excellent Product'),
(2,2,3,4,'Good Quality'),
(3,3,4,5,'Very Useful Book'),
(4,4,5,4,'Good Product'),
(5,5,6,3,'Average Product'),
(6,6,2,5,'Excellent Laptop');
USE OnlineShopping;
SELECT * FROM CUSTOMER;

SELECT
    C.Customer_ID,
    C.Name AS Customer_Name,
    O.Order_ID,
    O.Order_Date,
    O.Total_Amount,
    O.Status
FROM CUSTOMER C
JOIN `ORDER` O
ON C.Customer_ID = O.Customer_ID;

SELECT
    P.Product_ID,
    P.Product_Name,
    C.Category_Name,
    P.Price,
    P.Stock
FROM PRODUCT P
JOIN CATEGORY C
ON P.Category_ID = C.Category_ID;

SELECT
    COUNT(*) AS Total_Products,
    SUM(Price) AS Total_Product_Value,
    AVG(Price) AS Average_Product_Price,
    MAX(Price) AS Maximum_Product_Price,
    MIN(Price) AS Minimum_Product_Price
FROM PRODUCT;

SELECT
    Category_ID,
    COUNT(*) AS Total_Products
FROM PRODUCT
GROUP BY Category_ID;

SELECT
    Product_ID,
    Product_Name,
    Price
FROM PRODUCT
WHERE Price > (
    SELECT AVG(Price)
    FROM PRODUCT
);

CREATE OR REPLACE VIEW Customer_Order_View AS
SELECT
    C.Customer_ID,
    C.Name AS Customer_Name,
    C.Email,
    O.Order_ID,
    O.Order_Date,
    O.Total_Amount,
    O.Status
FROM CUSTOMER C
JOIN `ORDER` O
ON C.Customer_ID = O.Customer_ID;

SELECT * FROM Customer_Order_View;

CREATE OR REPLACE VIEW Product_Category_View AS
SELECT
    P.Product_ID,
    P.Product_Name,
    C.Category_Name,
    P.Price,
    P.Stock
FROM PRODUCT P
JOIN CATEGORY C
ON P.Category_ID = C.Category_ID;

SELECT * FROM Product_Category_View;

UPDATE PRODUCT
SET Price = 22000
WHERE Product_ID = 1;

SELECT * FROM PRODUCT
WHERE Product_ID = 1;

DELETE FROM REVIEW
WHERE Review_ID = 6;

SELECT * FROM REVIEW;
