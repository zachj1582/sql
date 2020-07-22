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

CREATE TABLE `physiscian` (
	`physician_id` int NOT NULL AUTO_INCREMENT,
	`employee_name` varchar(255) NOT NULL,
	PRIMARY KEY (`physician_id`)
);

CREATE TABLE `patient` (
	`patient_id` int NOT NULL AUTO_INCREMENT,
	`patient_name` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`ph_number` varchar(10) NOT NULL,
	PRIMARY KEY (`patient_id`)
);

CREATE TABLE `diagnoses` (
	`patient_id` int NOT NULL,
	`physician_id` int NOT NULL,
	`diagnoses_name` varchar(400) NOT NULL,
	`diagnoses_desc` varchar(2000) NOT NULL,
	`diagnoses_id` int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`diagnoses_id`)
);

CREATE TABLE `patient_visits` (
	`visit_id` int NOT NULL AUTO_INCREMENT,
	`diagnoses_id` int NOT NULL,
	`visit_date_time` DATETIME NOT NULL,
	`patient_id` int NOT NULL,
	`physician_id` int NOT NULL,
	`visit_notes` varchar(2000) NOT NULL,
	PRIMARY KEY (`visit_id`)
);

CREATE TABLE `pre_existing_conditions` (
	`condition_id` int NOT NULL AUTO_INCREMENT,
	`patient_id` int NOT NULL,
	`condition_name` varchar(400) NOT NULL,
	`condition_description` varchar(2000) NOT NULL,
	`condition_still_exists` BOOLEAN NOT NULL,
	PRIMARY KEY (`condition_id`)
);

CREATE TABLE `patient_medications` (
	`medication_id` int NOT NULL AUTO_INCREMENT,
	`medication_name` varchar(400) NOT NULL,
	`medication_description` varchar(500) NOT NULL,
	`patient_id` int NOT NULL,
	`prescribing_physician_id` int,
	PRIMARY KEY (`medication_id`)
);

ALTER TABLE `diagnoses` ADD CONSTRAINT `diagnoses_fk0` FOREIGN KEY (`patient_id`) REFERENCES `patient`(`patient_id`);

ALTER TABLE `diagnoses` ADD CONSTRAINT `diagnoses_fk1` FOREIGN KEY (`physician_id`) REFERENCES `physiscian`(`physician_id`);

ALTER TABLE `patient_visits` ADD CONSTRAINT `patient_visits_fk0` FOREIGN KEY (`diagnoses_id`) REFERENCES `diagnoses`(`diagnoses_id`);

ALTER TABLE `patient_visits` ADD CONSTRAINT `patient_visits_fk1` FOREIGN KEY (`patient_id`) REFERENCES `patient`(`patient_id`);

ALTER TABLE `patient_visits` ADD CONSTRAINT `patient_visits_fk2` FOREIGN KEY (`physician_id`) REFERENCES `physiscian`(`physician_id`);

ALTER TABLE `pre_existing_conditions` ADD CONSTRAINT `pre_existing_conditions_fk0` FOREIGN KEY (`patient_id`) REFERENCES `patient`(`patient_id`);

ALTER TABLE `patient_medications` ADD CONSTRAINT `patient_medications_fk0` FOREIGN KEY (`patient_id`) REFERENCES `patient`(`patient_id`);

ALTER TABLE `patient_medications` ADD CONSTRAINT `patient_medications_fk1` FOREIGN KEY (`prescribing_physician_id`) REFERENCES `physiscian`(`physician_id`);


3. A marketing company is setting up a rating management system for products belonging to one of their clients.  They want to keep track of the product ratings provided by each customer.  Set up a relational database model to keep track of the product ratings of different products provided by each customer.  

CREATE TABLE `Products` (
	`product_id` int NOT NULL AUTO_INCREMENT,
	`product_name` varchar(255) NOT NULL,
	`product_description` varchar(500) NOT NULL,
	`product_price` int NOT NULL,
	PRIMARY KEY (`product_id`)
);

CREATE TABLE `rating` (
	`rating_id` int NOT NULL AUTO_INCREMENT,
	`rating` int NOT NULL,
	`product_id` int NOT NULL,
	PRIMARY KEY (`rating_id`)
);

CREATE TABLE `customer_demographics` (
	`customer_id` int NOT NULL AUTO_INCREMENT,
	`gender` varchar(1),
	`region` varchar(100),
	`income_scale` varchar(50),
	`age_range` varchar(50),
	`rating_id` int NOT NULL,
	PRIMARY KEY (`customer_id`)
);

ALTER TABLE `rating` ADD CONSTRAINT `rating_fk0` FOREIGN KEY (`product_id`) REFERENCES `Products`(`product_id`);

ALTER TABLE `customer_demographics` ADD CONSTRAINT `customer_demographics_fk0` FOREIGN KEY (`rating_id`) REFERENCES `rating`(`rating_id`);


4. A university wants to set up a system for managing their students and student advisors.  Once a student chooses their major, they are assigned a student advisor that has experience in that particular major.   Once assigned, the advisor can help them get through the major they have selected.  The university wants to keep track of all the majors, students, and advisors.  Design a relational database schema to model the system.  

CREATE TABLE `student` (
	`student_id` int NOT NULL AUTO_INCREMENT,
	`student_name` varchar(100) NOT NULL,
	`student_major_id` int NOT NULL,
	`advisor_id` int NOT NULL,
	`student_notes_id` int NOT NULL,
	PRIMARY KEY (`student_id`)
);

CREATE TABLE `student_advisor` (
	`advisor_id` int NOT NULL AUTO_INCREMENT,
	`advisor_name` varchar(100) NOT NULL,
	`advisor_field` varchar(100) NOT NULL,
	`student_id` int NOT NULL,
	PRIMARY KEY (`advisor_id`)
);

CREATE TABLE `major` (
	`major_id` int NOT NULL AUTO_INCREMENT,
	`major_name` varchar(100) NOT NULL,
	`major_degree` varchar(100) NOT NULL,
	`major_field` varchar(100) NOT NULL,
	PRIMARY KEY (`major_id`)
);

CREATE TABLE `student_notes` (
	`notes_id` int NOT NULL AUTO_INCREMENT,
	`note` TEXT NOT NULL,
	`student_id` int NOT NULL,
	`advisor_id` int NOT NULL,
	PRIMARY KEY (`notes_id`)
);

ALTER TABLE `student` ADD CONSTRAINT `student_fk0` FOREIGN KEY (`student_major_id`) REFERENCES `major`(`major_id`);

ALTER TABLE `student` ADD CONSTRAINT `student_fk1` FOREIGN KEY (`advisor_id`) REFERENCES `student_advisor`(`advisor_id`);

ALTER TABLE `student` ADD CONSTRAINT `student_fk2` FOREIGN KEY (`student_notes_id`) REFERENCES `student_advisor`(`advisor_id`);

ALTER TABLE `student_advisor` ADD CONSTRAINT `student_advisor_fk0` FOREIGN KEY (`student_id`) REFERENCES `student`(`student_id`);

ALTER TABLE `student_notes` ADD CONSTRAINT `student_notes_fk0` FOREIGN KEY (`student_id`) REFERENCES `student`(`student_id`);

ALTER TABLE `student_notes` ADD CONSTRAINT `student_notes_fk1` FOREIGN KEY (`advisor_id`) REFERENCES `student_advisor`(`advisor_id`);


5. A drop shipping website wants to keep track of their customers, products, and vendors.  They also want to keep track of the orders that customers have placed.  Create a relational database schema to model all of the data the drop shipping website needs.   

CREATE TABLE `customer` (
	`customer_id` int NOT NULL AUTO_INCREMENT,
	`customer_name` varchar(100) NOT NULL,
	`customer_ph_number` varchar(10) NOT NULL,
	`customer_email` varchar(100) NOT NULL,
	`customer_address` varchar(200) NOT NULL,
	PRIMARY KEY (`customer_id`)
);

CREATE TABLE `product` (
	`Product_id` int NOT NULL AUTO_INCREMENT,
	`Product_name` varchar(100) NOT NULL,
	`Product_description` varchar(400) NOT NULL,
	`Product_price` DECIMAL NOT NULL,
	`Product_image` TEXT NOT NULL,
	`vendor_id` int NOT NULL,
	PRIMARY KEY (`Product_id`)
);

CREATE TABLE `vendor` (
	`vendor_id` int NOT NULL AUTO_INCREMENT,
	`vendor_name` varchar(100) NOT NULL,
	`vendor_ph_number` varchar(10) NOT NULL,
	`vendor_address` varchar(200) NOT NULL,
	`vendor_email` varchar(200) NOT NULL,
	PRIMARY KEY (`vendor_id`)
);

CREATE TABLE `order` (
	`order_id` int NOT NULL AUTO_INCREMENT,
	`order_date_time` DATETIME NOT NULL,
	`order_total` DATETIME NOT NULL,
	`customer_id` int NOT NULL,
	PRIMARY KEY (`order_id`)
);

CREATE TABLE `order_item` (
	`order_item_id` int NOT NULL AUTO_INCREMENT,
	`order_id` int NOT NULL,
	`product_id` int NOT NULL,
	`quantity` int NOT NULL,
	`order_price` int NOT NULL DEFAULT 'product_price * quantity',
	PRIMARY KEY (`order_item_id`)
);

ALTER TABLE `product` ADD CONSTRAINT `product_fk0` FOREIGN KEY (`vendor_id`) REFERENCES `vendor`(`vendor_id`);

ALTER TABLE `order` ADD CONSTRAINT `order_fk0` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`);

ALTER TABLE `order_item` ADD CONSTRAINT `order_item_fk0` FOREIGN KEY (`order_id`) REFERENCES `order`(`order_id`);

ALTER TABLE `order_item` ADD CONSTRAINT `order_item_fk1` FOREIGN KEY (`product_id`) REFERENCES `product`(`Product_id`);
