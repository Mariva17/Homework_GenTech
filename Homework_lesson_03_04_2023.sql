-- (1) Описать связи между таблицами БД "песочница"

-- Customers.CustomerID (1 : M) <-> Orders.CustomerID
-- Categories.CategoryID (1 : M) <-> Products.CategoryID
-- Employees.EmployeeID (1 : M) <-> Orders.EmployeeID
-- Orders.OrderID (1 : M) <-> OrderDetails.OrderID
-- Products.ProductID (1 : M) <-> OrderDetails.ProductID
-- Shippers.ShipperID (1 : M) <-> Orders.ShipperID
-- Suppliers.SupplierID (1 : M) <-> Products.SupplierID

-- (2) Вывести страны клиентов (БД platform)

SELECT country
FROM users;

-- (3) Вывести пользователей без пароля (БД platform)

SELECT *
FROM users
WHERE password='';

-- (4) Вывести страны донаторов с максимальным и минимальным пожертвованиями (БД platform)

(SELECT
users.country,
donations.amount AS donation_amount
FROM donations
JOIN users ON donations.donator_id=users.user_id
ORDER BY donations.amount DESC 
LIMIT 1)

UNION

(SELECT
users.country,
donations.amount AS donation_amount
FROM donations
JOIN users ON donations.donator_id=users.user_id
ORDER BY donations.amount 
LIMIT 1);

