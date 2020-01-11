DROP DATABASE IF EXISTS bamazonDB;
CREATE database bamazonDB;

USE bamazonDB;

CREATE TABLE products (
    item_id INT NOT NULL AUTO_INCREMENT,
    product_name VARCHAR (100) NOT NULL,
    department_name VARCHAR (100) NOT NULL,
    price DECIMAL (10, 2),
    stock_quantity INT NOT NULL,
    PRIMARY KEY (item_id)
);

INSERT INTO products (product_name, department_name, price, stock_quantity) 
VALUES ('face wash', 'skincare', 10.00, 50);

INSERT INTO products (product_name, department_name, price, stock_quantity) 
VALUES ('ice cream', 'frozen foods', 4.25, 25);

INSERT INTO products (product_name, department_name, price, stock_quantity) 
VALUES ('toothpaste', 'bath products', 3.00, 30);

INSERT INTO products (product_name, department_name, price, stock_quantity) 
VALUES ('soap', 'bath products', 2.50, 75);

INSERT INTO products (product_name, department_name, price, stock_quantity) 
VALUES ('socks', 'clothing', 1.00, 15);

INSERT INTO products (product_name, department_name, price, stock_quantity) 
VALUES ('dish soap', 'kitchen products', 5.25, 45);

INSERT INTO products (product_name, department_name, price, stock_quantity) 
VALUES ('fishing pole', 'outdoors', 35.00, 15);

INSERT INTO products (product_name, department_name, price, stock_quantity) 
VALUES ('calendars', 'stationary', 3.00, 55);

INSERT INTO products (product_name, department_name, price, stock_quantity) 
VALUES ('knit beanies', 'clothing', 13.50, 20);

INSERT INTO products (product_name, department_name, price, stock_quantity) 
VALUES ('chopping board', 'kitchen products', 20.10, 35);


SELECT * FROM products;