**Data Modeling Exercises**

For these exercises, create a Database Schema Diagram for the following scenarios.  You can use any Database modeling tool to complete the job.  Below are a few choices : 
  
 - <code>https://app.dbdesigner.net/</code>
 - <code>https://sqldbm.com/</code>
 - <code>https://app.genmymodel.com/</code>

1. TEKCafe  is looking to design a relational database management system.  They have to keep track of their customers in relation to the orders they make.  TEKCafe is interested in keeping track of all of their products that their customers will order.  TEK Cafe currently has the following products available for customers to purchase:

- Teas
- Coffees
- Coffee Mugs
- Frappuccinos
- Design a relational database schema to keep track of the data that TEK Cafe is looking to model.

CREATE TABLE `Customers` (
	`customer_id` INT NOT NULL AUTO_INCREMENT,
	`customer_name` varchar(255) NOT NULL,
	`customer_email` varchar(255) NOT NULL,
	PRIMARY KEY (`customer_id`)
);

CREATE TABLE `customer_orders` (
	`customer_order_id` INT NOT NULL AUTO_INCREMENT,
	`customer_id` INT NOT NULL,
	PRIMARY KEY (`customer_order_id`)
);

CREATE TABLE `products` (
	`product_id` INT NOT NULL AUTO_INCREMENT,
	`product_name` varchar(50) NOT NULL,
	`product_description` TEXT NOT NULL,
	`price` DECIMAL NOT NULL,
	`product_type` varchar(50) NOT NULL,
	PRIMARY KEY (`product_id`)
);

CREATE TABLE `order_items` (
	`order_item_id` INT NOT NULL AUTO_INCREMENT,
	`customer_order_id` INT NOT NULL,
	`product_id` INT NOT NULL,
	`product_quantity` INT NOT NULL,
	`order_price` INT NOT NULL,
	PRIMARY KEY (`order_item_id`)
);

ALTER TABLE `customer_orders` ADD CONSTRAINT `customer_orders_fk0` FOREIGN KEY (`customer_id`) REFERENCES `Customers`(`customer_id`);

ALTER TABLE `order_items` ADD CONSTRAINT `order_items_fk0` FOREIGN KEY (`customer_order_id`) REFERENCES `customer_orders`(`customer_order_id`);

ALTER TABLE `order_items` ADD CONSTRAINT `order_items_fk1` FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`);


2. A medical center employs several physicians. A physician can see many patients, and a patient can be seen by many physicians though not always on the one visit. On any particular visit, a patient has one or more diagnoses.  Model a basic relational database to model this medical center.  

3. A marketing company is setting up a rating management system for products belonging to one of their clients.  They want to keep track of the product ratings provided by each customer.  Set up a relational database model to keep track of the product ratings of different products provided by each customer.  

4. A university wants to set up a system for managing their students and student advisors.  Once a student chooses their major, they are assigned a student advisor that has experience in that particular major.   Once assigned, the advisor can help them get through the major they have selected.  The university wants to keep track of all the majors, students, and advisors.  Design a relational database schema to model the system.  

5. A drop shipping website wants to keep track of their customers, products, and vendors.  They also want to keep track of the orders that customers have placed.  Create a relational database schema to model all of the data the drop shipping website needs.   

