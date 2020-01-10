DROP DATABASE IF EXISTS bamazonDB;
CREATE database bamazonDB;

USE bamazonDB;

CREATE TABLE products (
    item_id INT NOT NULL AUTO_INCREMENT,
    product_name VARCHAR (100) NOT NULL,
    department_name VARCHAR (100) NOT NULL,
    price DECIMAL (10, 2);
    stock_quantity INT NOT NULL;
    primary key (item_id)
)

