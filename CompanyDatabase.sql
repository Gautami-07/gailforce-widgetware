-- Create Employees table
CREATE TABLE Employees (
  EmployeeID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Position VARCHAR(50),
  DepartmentID INT,
  HireDate DATE,
  Salary DECIMAL(10, 2)
);

-- Create Departments table
CREATE TABLE Departments (
  DepartmentID INT PRIMARY KEY,
  DepartmentName VARCHAR(50),
  ManagerID INT
);

-- Create Orders table
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(100),
  OrderDate DATE,
  TotalAmount DECIMAL(10, 2)
);

-- Create Products table
CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(100),
  Category VARCHAR(50),
  Price DECIMAL(10, 2),
  StockQuantity INT
);

-- Create OrderDetails table with named foreign keys
CREATE TABLE OrderDetails (
  OrderDetailID INT PRIMARY KEY,
  OrderID INT,
  ProductID INT,
  Quantity INT,
  Price DECIMAL(10, 2),
  CONSTRAINT fk_order
    FOREIGN KEY (OrderID) 
    REFERENCES Orders (OrderID),
  CONSTRAINT fk_product
    FOREIGN KEY (ProductID) 
    REFERENCES Products (ProductID)
);


-- Insert sample records into Employees table
INSERT INTO Employees VALUES
(1, 'John', 'Doe', 'Manager', 1, '2020-01-15', 75000.00),
(2, 'Jane', 'Smith', 'Developer', 2, '2019-03-25', 65000.00),
(3, 'Michael', 'Johnson', 'Analyst', 3, '2021-07-30', 60000.00),
(4, 'Emily', 'Davis', 'Sales', 1, '2018-05-20', 55000.00),
(5, 'David', 'Brown', 'HR', 4, '2017-11-10', 50000.00);

-- Insert sample records into Departments table
INSERT INTO Departments VALUES
(1, 'Sales', 1),
(2, 'IT', 2),
(3, 'Finance', 3),
(4, 'Human Resources', 5),
(5, 'Marketing', NULL);

-- Insert sample records into Orders table
INSERT INTO Orders VALUES
(1, 'Alice Johnson', '2023-06-01', 250.50),
(2, 'Bob Lee', '2023-06-05', 120.00),
(3, 'Carol White', '2023-06-10', 300.00),
(4, 'David Green', '2023-06-15', 450.75),
(5, 'Eva Black', '2023-06-20', 180.20);

-- Insert sample records into Products table
INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 1000.00, 20),
(2, 'Smartphone', 'Electronics', 500.00, 50),
(3, 'Desk Chair', 'Furniture', 150.00, 30),
(4, 'Monitor', 'Electronics', 200.00, 25),
(5, 'Keyboard', 'Accessories', 50.00, 100);

-- Insert sample records into OrderDetails table
INSERT INTO OrderDetails VALUES
(1, 1, 1, 1, 1000.00),
(2, 2, 2, 2, 500.00),
(3, 3, 3, 1, 150.00),
(4, 4, 4, 2, 200.00),
(5, 5, 5, 4, 50.00);
