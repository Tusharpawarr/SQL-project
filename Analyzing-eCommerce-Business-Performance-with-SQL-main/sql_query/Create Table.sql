-- 1) Creating a database by right-clicking on Databases > Create > Database.. with the name ecommerce_miniproject.


-- 2)  Creating a table using the CREATE TABLE statement, following the column names in the CSV and ensuring that their data types are appropriate.


CREATE TABLE customers_dataset (
	customer_id varchar,
	customer_unique_id varchar,
	customer_zip_code_prefix varchar,
	customer_city varchar,
	customer_state varchar
);

CREATE TABLE sellers_dataset (
	seller_id varchar,
	seller_zip_code_prefix varchar,
	seller_city varchar,
	seller_state varchar
);

CREATE TABLE geolocation_dataset (
	geolocation_zip_code_prefix varchar,
	geolocation_lat decimal,
	geolocation_lng decimal,
	geolocation_city varchar,
	geolocation_state varchar
);

CREATE TABLE product_dataset (
	product_id varchar,
	product_category_name varchar,
	product_name_lenght int,
	product_description_lenght int,
	product_photos_qty int,
	product_weight_g decimal,
	product_length_cm decimal,
	product_height_cm decimal,
	product_width_cm decimal
);

CREATE TABLE orders_dataset (
	order_id varchar,
	customer_id varchar,
	order_status varchar,
	order_purchase_timestamp timestamp,
	order_approved_at timestamp,
	order_delivered_carrier_date timestamp,
	order_delivered_customer_date timestamp,
	order_estimated_delivery_date timestamp
);

CREATE TABLE order_items_dataset (
	order_id varchar,
	order_item_id int,
	product_id varchar,
	seller_id varchar,
	shipping_limit_date timestamp,
	price decimal,
	fright_value decimal
);

CREATE TABLE order_payments_dataset (
	order_id varchar,
	payment_sequential int,
	payment_type varchar,
	payment_installments int,
	payment_value decimal
);

CREATE TABLE order_reviews_dataset (
	review_id varchar,
	order_id varchar,
	review_score int,
	review_comment_title varchar,
	review_comment_message varchar,
	review_creation_date timestamp,
	review_answer_timestamp timestamp
);


-- 3) Import the CSV file into each respective table by right-clicking on the table name > Import/Export Data.


-- 4) Determining the Primary Key and Foreign Key to establish a relationship between the tables,
-- Beforehand, ensuring the Primary Key has unique values and the data type matches between the Primary Key and Foreign Key in the dataset.

-- PRIMARY KEY
ALTER TABLE customers_dataset ADD CONSTRAINT customers_dataset_pkey ADD PRIMARY KEY(customer_id);
ALTER TABLE sellers_dataset ADD CONSTRAINT sellers_dataset_pkey ADD PRIMARY KEY(seller_id);
ALTER TABLE product_dataset ADD CONSTRAINT product_dataset_pkey ADD PRIMARY KEY(product_id);
ALTER TABLE orders_dataset ADD CONSTRAINT orders_dataset_pkey ADD PRIMARY KEY(order_id);

-- FOREIGN KEY
ALTER TABLE orders_dataset ADD FOREIGN KEY (customer_id) REFERENCES customers_dataset;
ALTER TABLE order_payments_dataset ADD FOREIGN KEY (order_id) REFERENCES orders_dataset;
ALTER TABLE order_reviews_dataset ADD FOREIGN KEY (order_id) REFERENCES orders_dataset;
ALTER TABLE order_items_dataset ADD FOREIGN KEY (order_id) REFERENCES orders_dataset;
ALTER TABLE order_items_dataset ADD FOREIGN KEY (product_id) REFERENCES product_dataset;
ALTER TABLE order_items_dataset ADD FOREIGN KEY (seller_id) REFERENCES sellers_dataset;

-- 5)Create an Entity-Relationship Diagram (ERD) by right-clicking on the ecommerce_miniproject database and selecting Generate ERD.
