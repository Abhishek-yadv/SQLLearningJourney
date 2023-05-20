-- NULL(null value)
-- don;t forgate to line end with ";"
-- USE "*" to take all value
-- -- Use single quotes for "LIKE" Clause
## Database is a collection of data stored in a format that can easily be accessed
## Rational DBMS (we stored data in table ) MySQL,oracle
## Non-Relational DBMS ( we dont have table or relation) they have hteir own querry language

######################################################
### THE SELECT Statement(How to retrieve data from single data)
USE sql_store;
SELECT * FROM customers
;

################################
USE sql_store;
SELECT * 
FROM customers
WHERE customer_id = 1
ORDER BY first_name
;

#################################
USE sql_store;
SELECT 1, 2
FROM customers
;

##################################################
############################## The SELECT Clause
USE sql_store;
SELECT first_name, last_name, points # Here order is sensitive chainging coloumn order effect coloumn
FROM customers
;

##################################
USE sql_store;
SELECT first_name, last_name, points + 10
FROM customers
;
##################################
USE sql_store;
SELECT 
      first_name,
      last_name,
      points,
      (points + 10) * 100 AS "discount factor"
FROM customers
;

############ We can use astrisk to select all coloumn ############
SELECT state
FROM customers
;

#############################################
######################################
################## DISTINCT keyword
# With this querry we can retireve uniqness 
# By this we can remove duplicate
SELECT state
FROM customers
;
########################################         Exercize
# Return all the products
# name
# unit price
# new price(unit price * 1.1) 
SELECT
     products.name,
     products.unit_price,
     unit_price * 1.1 AS new_price
FROM products
;
################################       OR
SELECT name, unit_price, unit_price * 1.1 AS new_price
FROM products
;


##################################################
################################ THE WHERE CLAUSE
SELECT * 
FROM Customers
WHERE points > 3000
;

##### Compare items (>, >=, <, <=,=, !=, <>
SELECT * 
FROM Cusotmers
WHERE state = 'VA'
;

####################################
SELECT *
FROM Customers
WHERE birthdate > '1990-01-01'
;

################################################      EXERCIZE
------ Get the orders placed this year
SELECT *
FROM orders
WHERE order_date >= '2019-01-01'
;


#####################################################
############### The AND, OR and NOT Operators
# AND (When both condition are true)
SELECT *
FROM Customers
WHERE birth_date > '1990-01-01' AND points > 1000
;

#####################################
# OR(When one of the both condition are met)
SELECT *
FROM Customers
WHERE birth_date > '1990-01-01' OR points > 1000
;


#####################################
USE sql_store;
SELECT * 
FROM Customers
WHERE birth_date > '1990-01-01' OR
		 (points > 1000 AND state = 'VA')
;

########################################## Another loical oprater NOT
# we can use NOT operater negate
USE sql_store;
SELECT * 
FROM Customers
WHERE NOT birth_date > '1990-01-01' OR points > 1000
;

###########################################        EXERCIZE
# From the order items table, get the items
# for order #6
# where the total price is greater than 30
USE sql_store;
SELECT *
FROM order_items
WHERE order_id = 6 AND unit_price * quantity > 30
;
####################################################
################################### The IN Operator
# we can not add boolean expressionn in SQL
SELECT * 
FROM Customers
WHERE state = 'VA' OR 'GA' OR 'FA' #its wrong
;
################################ right here
SELECT * 
FROM Customers
WHERE state = 'VA' OR state ='GA' OR state = 'FA'
;

################################ more easier ways
SELECT * 
FROM Customers
WHERE state IN ('VA','GA','FA' )
;

############################### One more example
SELECT * FROM customers
WHERE STATE NOT IN ('VA','GA','FA' )
;

############################################          EXAMPLE
### Return products with
# quantity in stock eqal to 49,38,72
SELECT *
FROM products
WHERE quantity_in_stock IN (49,38,72)
;

################################################################
########################################## BETWEEN OPERATOR
SELECT *
FROM customers
WHERE points >= 1000 AND points <=3000
;

#################################
SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 3000
;

##############################################          Exercize
SELECT * 
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01'
;

#######################################################
############################## THE LIKE OPERATOR
###########( % any number of characters)
#######( "_" single character)
SELECT * FROM customers
WHERE last_name LIKE 'b%'  #last_name start with B 
;

################################
SELECT * FROM customers
WHERE last_name LIKE 'brush%'  #last_name start with 'brush'
;

################################
SELECT * FROM customers
WHERE last_name LIKE '%b%'  #last_name that means we can have any number of character before or after b 
;

################################
SELECT * FROM customers
WHERE last_name LIKE '%y'  #In last_name end with "y"
;

################################
SELECT * FROM customers
WHERE last_name LIKE '_y'  #In last_name matches single character
;

################################
SELECT * FROM customers
WHERE last_name LIKE '_____y'  #In last_name matches single character
;

################################
SELECT * FROM customers
WHERE last_name LIKE 'b____y' #that means last_name start with b after b 4character follow by y
;

#######################################################      EXAMPLE
########## GET THE CUSTOMERS WHOSE
##### ADDRESSES CONTAIN TRAIL OR AVENUE
##### PHONE NUMBERS END WITH 9
SELECT * FROM
customers
WHERE address LIKE "%trail%" OR
      address LIKE "%avenue%" OR
      phone LIKE "%9"
;
###################################
SELECT * FROM
customers
WHERE phone NOT LIKE "%9"
;

#####################################################
##################################################
#############################The REGEXP Operator
## ("|"means or)
SELECT *
FROM customers
WHERE last_name REGEXP '^field'
;
##################################
SELECT *
FROM customers
WHERE last_name REGEXP 'field$'
;

##################################
SELECT *
FROM customers
WHERE last_name REGEXP 'field|mac'
;

##################################
SELECT *
FROM customers
WHERE last_name REGEXP 'field|mac|rose'

;

##################################
SELECT *
FROM customers
WHERE last_name REGEXP '^field|mac|rose' # it means last_name should be start with field or have contain mac or rose
;

##################################
SELECT *
FROM customers
WHERE last_name REGEXP 'field$|mac|rose' # it means last_name should be end with field or have contain mac or rose
;

##################################
SELECT *
FROM customers
WHERE last_name REGEXP '[gim]e' # that meatches any customer who have ge, ie,me in last_name
;

##################################
SELECT *
FROM customers
WHERE last_name REGEXP 'e[fmq]' # any customer who have "e" followed by f , m and q 

;
##################################
SELECT *
FROM customers
WHERE last_name REGEXP '[a-h]e' #[a-h] means (a,b,c,d,e,f,g,h)
;

#################################
-- When we put (^) before characters (a,b,c....)
-- we put ($)  after characters(a,b,c....)
-- ^ beginning
-- $ end
-- | logical or
-- [abcd] match any single character listed in bracket
-- [a-f] means represent range a to f
#####################################

##############################################             EXERCIZE
-- Get the customers whose
-- first names are ELKA or AMBUR
-- last names end with EY or ON
-- last names start with MY or contains SE
-- last names contain B followed by R or U
SELECT * FROM customers
WHERE first_name REGEXP "ELKA|AMBUR"
;

###############################
SELECT * FROM customers
WHERE last_name REGEXP "EY$|ON$"
;

##############################
SELECT * FROM customers
WHERE last_name REGEXP "^MY|SE"
;

###############################
SELECT * FROM customers
WHERE last_name REGEXP "B[RU]" or(br|bu)
;

####################################################################
############################################## THE "IS NULL" Operator
SELECT * FROM 
customers
WHERE phone IS NULL
;

###############################
SELECT * FROM 
customers
WHERE phone IS NOT NULL
;

################################################       Example
# Get the orders that are not shipped
SELECT * FROM orders
WHERE shipper_id IS NULL
;

##################################################################
###############################   ORDER BY Clause
SELECT * FROM customers
ORDER BY first_name ASC
;

################################
SELECT * FROM customers
ORDER BY first_name DESC
;

##################################
SELECT * FROM customers
ORDER BY first_name, state
;


##################################################    NOTE
# IN MySQL we can short by any coloumns whether that coloumn in select clause or not
SELECT first_name, last_name
FROM customers
ORDER BY birth_date
;

###################################
SELECT first_name, last_name, 10 AS points
FROM customers
ORDER BY points, first_name
;

###################################
SELECT first_name, last_name, 10 AS points
FROM customers
ORDER BY 1,2   #you should avoid bcz may be in future you add new coloumn in front of first_name
# - So shorting data by coloumn position produced unexpected result something you shoud avoid
# instead by coloumn name
 ;
 
 #######################################################      Example
SELECT 
     order_items.order_id,
     order_items.product_id,
     order_items.quantity,
     order_items.unit_price,
     order_items.unit_price * quantity AS toatal_price
FROM order_items
WHERE order_id = 2
ORDER BY quantity * unit_price DESC
;
############################################
############################## Second method
SELECT * ,quantity * unit_price AS total_price
FROM order_items
WHERE order_id = 2
ORDER BY total_price DESC
;

#######################################################
################################# The LIMIT CLAUSE
SELECT * FROM customers
LIMIT 3
;
##################################### Important
SELECT * 
FROM customers
LIMIT 6, 3  # It tells skip first 6 records then picked 3 records
-- page 1: 1-3
-- page 2: 4-6
-- page 3: 7-9 
;

###########################################################      Example
-- GET the top three loyal customers --
SELECT * FROM customers
ORDER BY points DESC
LIMIT 3
;


#############################################################
#######################################################
########################################## JOINS
# there is two types of joins 1st (INNER JOIN ) 2nd (Outer Join)
# by convention Inner JOIN as can represent as JOIN
# So INNER JOIN is optional

SELECT * FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id  
;

##################################
SELECT order_id, customer_id, first_name, last_name
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id
# When executing this we get error bcz Column 'customer_id' in field list is ambiguous(more than one)
# bcz we have customer_id coloumn in both orders and customers table so mysql
#-- is not sure which table do wanna select this column from that why it saying ambigious coloumn
# so we need to quantify this coloumn by prefixing it with table name we can either pick from cusrtomers table or orders table 
;

######### So here is solution
SELECT order_id, orders.customer_id, first_name, last_name
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id
;

############################################################
### Note:- By Using ALLIAS we can make our code even simpler
SELECT order_id, o.customer_id, first_name, last_name
FROM orders o
JOIN customers c
      ON o.customer_id = c.customer_id
;
  
###########################################################          Example
SELECT *
 FROM order_items
 JOIN products 
          ON products.product_id = order_items.product_id
;

#######################################
SELECT 
     order_id,
     order_items.product_id,
     order_items.quantity,
     order_items.unit_price
 FROM order_items
 JOIN products 
          ON products.product_id = order_items.product_id
;
##########################################
SELECT 
     order_id, 
     oi.product_id,
     oi.quantity,
     oi.unit_price
 FROM order_items oi
 JOIN products p
          ON p.product_id = oi.product_id
          
#USING allias it would be
# remember why unit_price coloumn has 2 places the reason for this is that price of product can change
# so for each order_items we wanna have price at the time user or customers placed the order 
# so this is snapshot of price at the given point in time the unit_price we have in products table is the current price right now
# we have s unit_price in order_items this is price bcz this is the price at the time of placed order 
;

####################################################################
#################################################################
######################################## Joining Across Databases
# How to combine coloumn tables from multiple databases
SELECT *
FROM order_items oi
JOIN sql_inventory.products p
ON oi.product_id = p.product_id
;
#################################### (2ND WAY) or 
USE sql_inventory;
SELECT *
FROM sql_store.order_items oi
JOIN products p
       ON oi.product_id = p.product_id
;

###################################
USE sql_inventory;
SELECT *
FROM sql_store.order_items
JOIN products 
     ON sql_store.order_items.product_id = products.product_id     
; 

####################################    
SELECT * 
FROM order_items oi
JOIN sql_inventory.products p
    on oi.product_id = p.product_id
;

##########################################################
########################################### (SELF JOINS)
#################################
# Note:- So joining a table with itself is pretty much the same as joining the table with an another table 
# --- the only diffrence we have to use diffrent allias we have to prefix each coloumn with allias
USE sql_hr;
SELECT 
     e.employee_id,
     e.first_name,
     m.first_name as Manager
FROM employees e
JOIN employees m
         ON e.reports_to = m.employee_id
;

###############################################################
###########################################################
###########################   Joining Multiple Tables
 USE sql_store;
 SELECT
     o.order_id,
     o.order_date,
     c.first_name,
     c.last_name,
     os.name AS status
 FROM orders o
 JOIN customers c
      ON o.customer_id = c.customer_id
########################################################### noted
JOIN order_statuses os
      ON o.status = os.order_status_id
;

##########################################################            Exercize
 -- 
USE sql_invoicing;
SELECT *
     FROM payments
     JOIN clients
           ON payments.client_id = clients.client_id
     JOIN payment_methods
           ON payments.payment_method = payment_methods.payment_method_id
;
     
-- ################
USE sql_invoicing;
SELECT 
      payments.date,
      payments.invoice_id,
      payments.amount,
      clients.name,
      payment_methods.name

     FROM payments
     JOIN clients
           ON payments.client_id = clients.client_id
     JOIN payment_methods
           ON payments.payment_method = payment_methods.payment_method_id
;


#####################################################
###########################################
-- -- (COMPOUND JOIN CONDITION) -- --
SELECT *
FROM order_items
JOIN order_item_notes
      ON order_items.order_id = order_item_notes.order_id
      AND order_items.product_id = order_item_notes.product_id
;


#################################################
########################################
-- -- -- (IMPLICIT JOIN SYNTAX)-- -- --)
----
SELECT *
FROM orders 
JOIN customers
     ON orders.customer_id = customers.customer_id
;

-- Below is also Same But this is type of implicit join
-- Implicit Join TYPE Syntax By using
SELECT *
FROM orders, customers
WHERE orders.customer_id = customers.customer_id
;

###############OR###############
SELECT *
FROM orders, customers
;


##########################################
##################################
#########################
-- -- OUTER JOINS --
USE sql_store;
 SELECT 
        customers.customer_id,
        customers.first_name,
        orders.order_id
 FROM customers
 JOIN orders
     ON customers.customer_id = orders.customer_id
ORDER BY customers.customer_id
;

###############################
#Customer who do not have order or not
-- when we use left join all the record from left table are return whether condition are true or not
SELECT 
	customers.customer_id,
    customers.first_name,
    orders.order_id
FROM customers
LEFT JOIN orders
	ON customers.customer_id = orders.customer_id
ORDER BY customers.customer_id

;
############################### correct order
-- Note :- you will   get same results 
SELECT 
	customers.customer_id,
    customers.first_name,
    orders.order_id
FROM customers
RIGHT JOIN orders
	ON customers.customer_id = orders.customer_id
ORDER BY customers.customer_id
;

-- Noted Point :- you will get all the customers whther they have ordered or not
SELECT 
	customers.customer_id,
    customers.first_name,
    orders.order_id
FROM orders
RIGHT JOIN Customers
	ON customers.customer_id = orders.customer_id
ORDER BY customers.customer_id
;



############################### Left join
USE sql_store;
 SELECT 
        customers.customer_id,
        customers.first_name,
        orders.order_id
 FROM customers
 LEFT JOIN orders
     ON customers.customer_id = orders.customer_id
ORDER BY customers.customer_id
;

############################### Right Join
USE sql_store;
 SELECT 
        customers.customer_id,
        customers.first_name,
        orders.order_id
 FROM customers
 RIGHT JOIN orders
     ON customers.customer_id = orders.customer_id
ORDER BY customers.customer_id
;
      
##################################################      Exercize
SELECT
     products.product_id,
     products.name,
     order_items.quantity
FROM products
LEFT JOIN order_items
     ON products.product_id = order_items.product_id 
;

###
SELECT
     products.product_id,
     products.name,
     order_items.quantity
FROM products
RIGHT JOIN order_items
     ON products.product_id = order_items.product_id 
;

###########################################################
################################################
## (OUTER JOINS BETWEEN MULTIPLE TABLE)
SELECT 
     customers.customer_id,
     customers.first_name,
     orders.order_id
FROM customers
LEFT JOIN orders
     ON customers.customer_id = orders.customer_id
ORDER BY customers.customer_id
;

#############################################
#######################################
####Outer Joins B/t Multiple Tables
SELECT
    customers.customer_id,
    customers.first_name,
    orders.order_id
FROM customers
LEFT JOIN orders
     ON customers.customer_id = orders.customer_id
JOIN shippers
   ON orders.shipper_id = shippers.shipper_id
ORDER BY customers.customer_id
;


######################################
####
SELECT
    customers.customer_id,
    customers.first_name,
    orders.order_id,
    shippers.name as shipper
    
FROM customers
LEFT JOIN orders
     ON customers.customer_id = orders.customer_id
LEFT JOIN shippers
   ON orders.shipper_id = shippers.shipper_id
ORDER BY customers.customer_id
;

###########################################
-- its not shhowwing all  orders
SELECT
    customers.customer_id,
    customers.first_name,
    orders.order_id,
    shippers.name as shipper
    
FROM customers
LEFT JOIN orders
     ON customers.customer_id = orders.customer_id
LEFT JOIN shippers
   ON orders.shipper_id = shippers.shipper_id
ORDER BY customers.customer_id
;

#####################################
SELECT
    customers.customer_id,
    customers.first_name,
    orders.order_id,
    shippers.name as shipper
    
FROM customers
 JOIN orders
     ON customers.customer_id = orders.customer_id
LEFT JOIN shippers
   ON orders.shipper_id = shippers.shipper_id
ORDER BY customers.customer_id    
;


#########################################################         Exercize
SELECT 
	orders.order_id,
    orders.order_date,
    customers.first_name,
    shippers.name
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id
JOIN Shippers
    ON orders.shipper_id = shippers.shipper_id
;

#######################################
SELECT 
	orders.order_id,
    orders.order_date,
    customers.first_name,
    shippers.name
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id
LEFT JOIN Shippers
    ON orders.shipper_id = shippers.shipper_id
;

################ IMPORTANT NOTED ###############
##################
SELECT 
	orders.order_id,
    orders.order_date,
    customers.first_name,
    shippers.name,
    order_statuses.name AS status
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id
LEFT JOIN Shippers
    ON orders.shipper_id = shippers.shipper_id
JOIN order_statuses
    ON orders.status = order_statuses.order_status_id
;

################################################
################################################
############ (SELF OUTER JOIN)
USE sql_hr;
SELECT 
    e.employee_id,
    e.first_name,
    m.first_name AS manager
FROM employees e
JOIN employees m
	ON e.reports_to = m.employee_id
-- it shows only manager  
;

##################################################
-- so we can solve this problem by using left join  
USE sql_hr;
SELECT 
    e.employee_id,
    e.first_name,
    m.first_name AS manager
FROM employees e
LEFT JOIN employees m
	ON e.reports_to = m.employee_id
;

##############################################
##################### (THE USING CLAUSE)
# USING Keyword only work if the coloumn name exactly same across diffrent table
USE sql_store;
SELECT 
    orders.order_id,
    customers.first_name
FROM orders
JOIN customers
     ON orders.customer_id = customers.customer_id   ## Is same as USING(customer_id) 

;
########### IS SAME AS #############
###
USE sql_store;
SELECT 
    orders.order_id,
    customers.first_name
FROM orders
JOIN customers
    USING (customer_id)
;
#####################################
####
SELECT
     orders.order_id,
     customers.first_name
FROM orders
JOIN customers
     USING(customer_id)
JOIN shippers
     USING(shipper_id)
     
;
#####################################
####
SELECT
     orders.order_id,
     customers.first_name,
     shippers.name AS shipper
FROM orders
JOIN customers
     USING(customer_id)
LEFT JOIN shippers
     USING(shipper_id)
;

####################################
SELECT *
FROM order_items
JOIN order_item_notes
    ON order_items.order_id = order_item_notes.order_Id AND
          order_items.product_id = order_item_notes.product_id
;

#####################################
SELECT *
FROM order_items
JOIN order_item_notes
    USING (order_id, product_id)
;

###################################
USE sql_invoicing;
SELECT 
     payments.date,
     clients.name AS client,
     payments.amount,
     payment_methods.name
FROM payments
JOIN clients
    USING(client_id)
JOIN payment_methods
    ON payments.payment_method = payment_methods.payment_method_id
;

#######################################
########## Natural Joins(Do not have control and figure out or guess the join)
SELECT
   orders.order_id,
   customers.first_name
FROM orders
NATURAL JOIN customers
;
###################################################
#################################### (CROSS JOIN)
#Cross Joins (we use cross join combine or join every record from 1st table with every record in second table)
SELECT
     customers.first_name AS customer,
     products.name AS product
FROM customers
CROSS JOIN products
ORDER BY customers.first_name
;
###################################
SELECT 
     customers.first_name AS customer,
     products.name AS product
FROM customers, products
ORDER BY customers.first_name
;


#####################################################            EXERCIZE
###### Implicit way######
SELECT 
     products.name,
     products.quantity_in_stock as Quantity,
     shippers.name
     FROM products, shippers
ORDER BY products.name

 ;   
####################################
# Explicit way
SELECT 
     products.name,
     products.quantity_in_stock as Quantity,
     shippers.name
     FROM products
CROSS JOIN shippers
ORDER BY products.name
 ;
 
 
##################################################
################################### (UNION)
######## IN sql we can also combine row
#USING the union operator we can combine records from multiple querry
SELECT *
 FROM orders
;

####################################
SELECT *
FROM orders
WHERE order_date >= '2019-01-01'
;

####################################
SELECT 
     order_id,
     order_date,
     "Active" AS status
FROM orders
WHERE order_date >= '2019-01-01'
;

###################################
SELECT 
     order_id,
     order_date,
     "Archived" AS status
FROM orders
WHERE order_date < '2019-01-01'
;

##################################### (UNION)
SELECT 
     order_id,
     order_date,
     "Active" AS status
FROM orders
WHERE order_date >= '2019-01-01'
UNION 
SELECT 
     order_id,
     order_date,
     "Archived" AS status
FROM orders
WHERE order_date < '2019-01-01'
;

######################################
SELECT first_name
FROM customers
UNION
SELECT name
FROM shippers
;

################# WRONG(bcz coloumn are not same)
SELECT first_name, last_name
FROM customers
UNION
SELECT name
FROM shippers
;

#########################################
SELECT name
FROM shippers
UNION
SELECT first_name
FROM customers
;

##################################
SELECT name AS full_name
FROM shippers
UNION
SELECT first_name
FROM customers
;
##################################################         (Exercize)
SELECT 
     customer_id,
     first_name,
     points,
     'Bronze' AS type
FROM customers
WHERE points < 2000
UNION
SELECT
     customer_id,
     first_name,
     points,
     'Silver' AS type
FROM customers
WHERE points > 2000 AND points < 3000
UNION
SELECT
     customer_id,
     first_name,
     points,
     'Gold' AS type
FROM customers
WHERE points > 3000
;

##############################################
###########################################
######################### (COLOUMN ATTRIBUTE)
############# Insert a single row
INSERT INTO customers(
		first_name,
        last_name,
        birth_date,
        address,
        city,
        state)
VALUES(
     'John',
     'Smith',
     '1990-01-01',
     'address',
     'city',
     'CA'
     )
;
##-- we can also suffle value like 
INSERT INTO customers(
		last_name,
        first_name,
        birth_date,
        address,
        city,
        state)
VALUES(
     'Smith',
     'John',
     '1990-01-01',
     'address',
     'city',
     'CA'
     )
;
###########################################
############# (INSERTING MULTIPLE ROWS)
# this how you can insert multiple row in one go
INSERT INTO shippers (name)
VALUES ('Shipper1'),
       ('Shipper2'),
       ('Shipper3')
;

##########################################################             Exercize
INSERT INTO products (name, quantity_in_stock, unit_price)
VALUES('Product1', 10, 1.95),
       ('Product2', 11, 1.95),
       ('Product3', 12, 1.95)
;


#########################################
#########################################
######  (INSERTING HIERARCHICAL ROWS)
# Insert Data in multiple table
-- orders table is parents and order_items is child 
-- so one row in the orders table can have one or more i children inside the order items table 
# so we can learn how to insert in multiple table 
-- Getting last inserted data 
INSERT INTO orders (customer_id,order_date, status)
VALUES ( 1, '2019-01-02', 1);
SELECT LAST_INSERT_ID()
;
###################################
INSERT INTO orders (customer_id,order_date, status)
VALUES ( 1, '2019-01-02', 1);
INSERT INTO order_items
VALUE
     (LAST_INSERT_ID(),1,1,2.95),
     (LAST_INSERT_ID(),2,1,2.95)
;

##############################################
##############################################
############### (CREATING A COPY OF A TABLE)
# how to copy data from one table to another table
CREATE TABLE orders_archived AS
SELECT * FROM orders
;
-- tables orders_archived has been created 

###################################
INSERT INTO orders_archived
SELECT *  #select statemetn is subquerry in INSERT statement
FROM orders
WHERE order_date < '2019-01-01'
;


##################################################          Exercize 
INSERT INTO invoices_archived
SELECT * FROM invoices
WHERE payment_date IS NOT null
;


#################################
USE sql_invoicing;
DROP TABLE if exists invoices_archived;
CREATE TABLE invoices_archived AS
SELECT 
     invoices.invoice_id,
     invoices.number,
     clients.name AS client,
     invoices.invoice_total,
     invoices.payment_total,
     invoices.invoice_date,
     invoices.payment_date,
     invoices.due_date
 FROM invoices
 JOIN clients
--     OR  USING (client_id)
      ON clients.client_id = invoices.client_id
WHERE payment_date IS NOT NULL
;

#######################################################
#######################################################
############################ (UPDATING A SINGLE ROW)
UPDATE invoices
SET payment_total = 10, payment_date = '2019-03-01'
WHERE invoice_id = 1
;

############################
UPDATE invoices
SET
    payment_total = invoice_total * 2,
    payment_date  = due_date
WHERE invoice_id = 3
;
##############################
UPDATE invoices
SET
    payment_total = invoice_total * 2,
    payment_date  = due_date
WHERE client_id = 3
;

#######################################################
##############################################
############################ (UPDATING A MULTIPLE ROW)
UPDATE invoices
SET
    payment_total = invoice_total * 2,
    payment_date  = due_date
WHERE CLIENT_id in(3, 4)
;
################################################          EXERCIZE
USE sql_store;
UPDATE customers
SET points = points + 50
WHERE birth_date < '1990-01-01'
;

#######################################################
##############################################
############# (USING SUBQUERIES IN UPDATES)
SELECT client_id
FROM clients
WHERE name = 'Myworks'
;

#####################################
UPDATE invoices
SET
    payment_total = invoice_total * 2,
    payment_date  = due_date
WHERE client_id = 
              (SELECT client_id
               FROM clients
                WHERE name = 'Myworks')
;
##########################################             ONE MORE EXAMPLE
###we gonna update all client who belongs to newyork and california 
UPDATE invoices
SET
    payment_total = invoice_total * 2,
    payment_date  = due_date
WHERE client_id = 
              (SELECT client_id
               FROM clients
                WHERE state IN ('CA', 'NY'))
;
  ######### BCZ THIS QUERY the SUBQUERY return multiple record we cant use = sign here anymore     
  #############  we need t o replace "IN" operater so it would be
  UPDATE invoices
SET
    payment_total = invoice_total * 2,
    payment_date  = due_date
WHERE client_id IN
              (SELECT client_id
               FROM clients
                WHERE state IN ('CA', 'NY'))
;
#############################################        ONE MORE EXAMPLE 
# example we gonna update all invoices where payment_date is null
# first_check right selection
SELECT *
FROM invoices
WHERE payment_date IS NULL 
;

########### then impliment
UPDATE invoices
SET 
     payment_total = invoice_total * 0.5,
     payment_date = due_date
WHERE payment_date IS NULL 
;

#############################################    ONE MORE EXAMPLE
UPDATE orders
SET comments = 'Gold customer'
WHERE customer_id IN
           (SELECT customer_id
             FROM customers
			WHERE points > 3000)
;
            
##########################################################
#####################################  DELETING ROWS

###############################
## delete whole table
DELETE FROM invoices;

#################################
## Delete specific table
DELETE FROM invoices
WHERE invoice_id = 1
;

#################################
# delete subqueiry
DELETE FROM invoices
WHERE client_id =(
          SELECT *
		  FROM clients
          WHERE name = 'Myworks')
          
########################################################
################################### Restoring Databases



