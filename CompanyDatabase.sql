-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50),
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    ManagerID INT
);

-- Create Products table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);

-- Create OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert sample data into Departments
INSERT INTO Departments (DepartmentName, ManagerID) VALUES
('Production', 1),
('Quality Control', 2),
('Logistics', 3),
('Sales', 4),
('HR', 5);

-- Insert sample data into Employees
INSERT INTO Employees (FirstName, LastName, Position, DepartmentID, HireDate, Salary) VALUES
('John', 'Doe', 'Production Manager', 1, '2015-01-01', 75000),
('Jane', 'Smith', 'QC Inspector', 2, '2016-02-15', 60000),
('Emily', 'Jones', 'Logistics Coordinator', 3, '2018-05-30', 50000),
('Michael', 'Brown', 'Sales Manager', 4, '2017-08-12', 65000),
('Sarah', 'Wilson', 'HR Specialist', 5, '2019-11-01', 55000);

-- Insert sample data into Products
INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('Widget A', 'Widgets', 25.00, 100),
('Widget B', 'Widgets', 30.00, 150),
('Gadget X', 'Gadgets', 45.00, 200),
('Gadget Y', 'Gadgets', 50.00, 80),
('Tool Z', 'Tools', 35.00, 60);

-- Insert sample data into Orders
INSERT INTO Orders (CustomerName, OrderDate, TotalAmount) VALUES
('Acme Corp', '2024-06-01', 1500.00),
('Beta Industries', '2024-06-15', 2000.00),
('Gamma LLC', '2024-06-20', 1750.00);

-- Insert sample data into OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 30, 25.00),
(1, 3, 10, 45.00),
(2, 2, 50, 30.00),
(2, 5, 20, 35.00),
(3, 1, 40, 25.00),
(3, 4, 15, 50.00);

-- Confirm data insertion
SELECT * FROM Employees;
SELECT * FROM Departments;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
