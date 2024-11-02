DROP DATABASE IF EXISTS db_app_food;
CREATE DATABASE IF NOT EXISTS db_app_food;

USE db_app_food;

CREATE TABLE users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255),
	email VARCHAR(255),
	password VARCHAR(255)
);

CREATE TABLE restaurants (
res_id INT PRIMARY KEY AUTO_INCREMENT,
res_name VARCHAR(255),
image VARCHAR(255),
`desc` VARCHAR(255)
);

CREATE TABLE rate_res (
user_id INT,
res_id INT,
amount INT,
date_rate DATETIME, 
CONSTRAINT fk_rate_user FOREIGN KEY (user_id) REFERENCES users(user_id),
CONSTRAINT fk_rate_restaurant FOREIGN KEY (res_id) REFERENCES restaurants(res_id),
PRIMARY KEY (user_id,res_id)
);

CREATE TABLE like_res (
user_id INT,
res_id INT,
date_like DATETIME,
CONSTRAINT fk_like_user FOREIGN KEY (user_id) REFERENCES users(user_id),
CONSTRAINT fk_like_restaurant FOREIGN KEY (res_id) REFERENCES restaurants(res_id),
PRIMARY KEY (user_id,res_id)
);

CREATE TABLE food_types (
type_id INT PRIMARY KEY AUTO_INCREMENT,
type_name VARCHAR(255)
);

CREATE TABLE foods (
food_id INT PRIMARY KEY AUTO_INCREMENT,
food_name VARCHAR(255),
image VARCHAR(255),
price FLOAT,
`desc` VARCHAR(255),
type_id INT,
CONSTRAINT fk_food_type FOREIGN KEY (type_id) REFERENCES food_types(type_id)
);

CREATE TABLe orders (
user_id INT,
food_id INT,
amount INT,
code VARCHAR(255),
arr_sub_id VARCHAR(255),
CONSTRAINT fk_order_user FOREIGN KEY (user_id) REFERENCES users(user_id),
CONSTRAINT fk_order_food FOREIGN KEY (food_id) REFERENCES foods(food_id),
PRIMARY KEY (user_id,food_id)
);

CREATE TABLE sub_foods (
sub_id INT PRIMARY KEY AUTO_INCREMENT,
sub_name VARCHAR(255),
sub_price FLOAT,
food_id INT,
CONSTRAINT fk_sub_food FOREIGN KEY (food_id) REFERENCES foods(food_id)
);

INSERT INTO users (full_name, email, password) VALUES
('John Doe', 'john@example.com', 'password123'),
('Jane Smith', 'jane@example.com', 'password123'),
('Alice Johnson', 'alice@example.com', 'password123'),
('Bob Brown', 'bob@example.com', 'password123'),
('Charlie Davis', 'charlie@example.com', 'password123'),
('Eva Green', 'eva@example.com', 'password123'),
('Frank Wright', 'frank@example.com', 'password123'),
('Grace Lee', 'grace@example.com', 'password123'),
('Henry Miller', 'henry@example.com', 'password123'),
('Isabel Turner', 'isabel@example.com', 'password123');

INSERT INTO restaurants (res_name, image, `desc`) VALUES
('Pasta Palace', 'image1.jpg', 'Delicious pasta and Italian dishes.'),
('Burger Barn', 'image2.jpg', 'Best burgers in town!'),
('Sushi Spot', 'image3.jpg', 'Fresh sushi and sashimi.'),
('Taco Town', 'image4.jpg', 'Authentic Mexican tacos.'),
('Curry Corner', 'image5.jpg', 'Spicy Indian curries and more.'),
('Pizza Place', 'image6.jpg', 'Hot and fresh pizzas.'),
('Steakhouse', 'image7.jpg', 'Juicy steaks and fine dining.'),
('Salad Station', 'image8.jpg', 'Healthy salads and smoothies.'),
('Dessert Den', 'image9.jpg', 'Sweet desserts and pastries.'),
('Seafood Shack', 'image10.jpg', 'Fresh seafood dishes.');

INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 1, 5, '2024-10-08 14:30:00'),
(1, 2, 4, '2024-10-08 14:30:00'),
(2, 2, 3, '2024-10-08 14:30:00'),
(2, 3, 5, '2024-10-08 14:30:00'),
(6, 1, 5, '2024-10-08 14:30:00'),
(6, 2, 4, '2024-10-08 14:30:00'),
(3, 2, 3, '2024-10-08 14:30:00'),
(3, 3, 5, '2024-10-08 14:30:00'),
(4, 1, 4, '2024-10-08 14:30:00'),
(5, 3, 5, '2024-10-08 14:30:00'),
(5, 4, 4, '2024-10-08 14:30:00');

INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 6, '2024-10-08 14:30:00'),
(1, 2, '2024-10-08 14:30:00'),
(2, 7, '2024-10-08 14:30:00'),
(2, 4, '2024-10-08 14:30:00'),
(3, 6, '2024-10-08 14:30:00'),
(3, 2, '2024-10-08 14:30:00'),
(7, 7, '2024-10-08 14:30:00'),
(8, 4, '2024-10-08 14:30:00'),
(4, 6, '2024-10-08 14:30:00'),
(2, 2, '2024-10-08 14:30:00'),
(4, 7, '2024-10-08 14:30:00'),
(8, 5, '2024-10-08 14:30:00');

INSERT INTO food_types (type_name) VALUES
('Italian'),
('American'),
('Japanese'),
('Mexican'),
('Indian'),
('Chinese'),
('Mediterranean'),
('Dessert'),
('Seafood'),
('Vegetarian');

INSERT INTO foods (food_name, image, price, `desc`, type_id) VALUES
('Spaghetti', 'spaghetti.jpg', 12.99, 'Traditional Italian pasta.', 1),
('Cheeseburger', 'burger.jpg', 10.99, 'Juicy beef burger with cheese.', 2),
('California Roll', 'sushi.jpg', 8.99, 'Sushi with crab and avocado.', 3),
('Taco', 'taco.jpg', 2.99, 'Soft or hard shell tacos.', 4),
('Butter Chicken', 'butter_chicken.jpg', 14.99, 'Creamy Indian chicken dish.', 5),
('Kung Pao Chicken', 'kung_pao.jpg', 11.99, 'Spicy stir-fried chicken with peanuts.', 6),
('Hummus', 'hummus.jpg', 6.99, 'Mediterranean chickpea dip.', 7),
('Cheesecake', 'cheesecake.jpg', 5.99, 'Rich and creamy cheesecake.', 8),
('Grilled Salmon', 'salmon.jpg', 19.99, 'Fresh grilled salmon fillet.', 9),
('Vegetable Stir Fry', 'stir_fry.jpg', 9.99, 'Mixed vegetables stir-fried in sauce.', 10);

INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id) VALUES
(1, 1, 2, 'ORD001', 'sub1'),
(2, 2, 1, 'ORD002', 'sub2'),
(3, 3, 3, 'ORD003', 'sub3'),
(4, 4, 1, 'ORD004', 'sub4'),
(5, 5, 2, 'ORD005', 'sub5'),
(6, 6, 1, 'ORD006', 'sub6'),
(7, 7, 2, 'ORD007', 'sub7'),
(2, 3, 3, 'ORD003', 'sub3'),
(4, 5, 1, 'ORD004', 'sub4'),
(2, 5, 2, 'ORD005', 'sub5'),
(8, 6, 1, 'ORD006', 'sub6'),
(2, 7, 2, 'ORD007', 'sub7'),
(8, 8, 1, 'ORD008', 'sub8');

INSERT INTO sub_foods (sub_name, sub_price, food_id) VALUES
('Extra Cheese', 1.00, 1),
('Bacon', 1.50, 2),
('Avocado', 1.00, 3),
('Guacamole', 1.50, 4),
('Naan Bread', 2.00, 5),
('Spring Rolls', 3.00, 6),
('Tzatziki', 1.00, 7),
('Chocolate Sauce', 0.50, 8),
('Asparagus', 2.50, 9),
('Chili Sauce', 0.75, 10);

-- SELECT* FROM users;
-- SELECT* FROM restaurants;
-- SELECT* FROM rate_res;
-- SELECT* FROM like_res;
-- SELECT* FROM food_types;
-- SELECT* FROM foods;
-- SELECT* FROM orders;
-- SELECT* FROM sub_foods;

-- BAI 1
SELECT users.user_id,users.full_name, users.email,users.password, COUNT(users.user_id) AS quantity
FROM users
right JOIN like_res on users.user_id=like_res.user_id
GROUP BY users.user_id
ORDER BY quantity DESC
LIMIT 5;

-- BAI 2
SELECT restaurants.res_id,restaurants.res_name, COUNT(restaurants.res_id) AS quantity
FROM restaurants
right JOIN like_res on restaurants.res_id=like_res.res_id
GROUP BY restaurants.res_id
ORDER BY quantity DESC
LIMIT 2;

-- BAI 3
SELECT users.user_id,users.full_name,COUNT(users.user_id) AS quantity
FROM users
LEFT JOIN orders on users.user_id=orders.user_id
GROUP BY users.user_id 
ORDER BY COUNT(users.user_id) DESC
LIMIT 1;

-- BAI 4
SELECT users.user_id,users.full_name
FROM users
LEFT JOIN orders on users.user_id=orders.user_id
LEFT JOIN like_res on users.user_id=like_res.user_id
LEFT JOIN rate_res on users.user_id=rate_res.user_id
WHERE 
    like_res.user_id IS NULL 
    AND rate_res.user_id IS NULL 
    AND orders.user_id IS NULL;
