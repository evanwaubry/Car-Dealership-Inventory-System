-- 1. UNIVERSAL DATABASE SETUP
CREATE DATABASE IF NOT EXISTS CarDealershipDB;
USE CarDealershipDB;

-- 2. CREATE TABLES (Independent tables first)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY auto_increment,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(255),
    Email VARCHAR(100) UNIQUE,
    Address VARCHAR(255)
);

CREATE TABLE Cars (
    CarID INT PRIMARY KEY auto_increment,
    Make VARCHAR(100),
    Model VARCHAR (200),
    YearMade INT,
    VIN VARCHAR(50) UNIQUE,
    Price DECIMAL(10, 2),
    CarStatus BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE Managers (
    ManagerID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(255),
    Email VARCHAR(100) UNIQUE
);

-- 3. CREATE TABLES (Dependent tables next)
CREATE TABLE Salespersons (
    SalespersonID INT PRIMARY KEY auto_increment,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(255),
    Email VARCHAR(100) UNIQUE,
    HireDate DATE NOT NULL,
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Managers(ManagerID)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY auto_increment,
    CustomerID INT NOT NULL,
    CarID INT NOT NULL,
    SalespersonID INT NOT NULL,
    SaleDate DATE NOT NULL,
    SalePrice DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (SalespersonID) REFERENCES Salespersons(SalespersonID)
);

CREATE TABLE ServiceAppointments (
    AppointmentID INT PRIMARY KEY auto_increment,
    CustomerID INT NOT NULL,
    CarID INT NOT NULL,
    ServiceDate DATE NOT NULL,
    ServiceDetails VARCHAR(150) NOT NULL,
    Cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID)
);

-- 4. INSERT DATA
INSERT INTO Customers (FirstName, LastName, PhoneNumber, Email, Address) VALUES
('John', 'Doe', '555-1234', 'john.doe@example.com', '123 Elm St'),
('Jane', 'Smith', '555-5678', 'jane.smith@example.com', '456 Oak St'),
('Michael', 'Johnson', '555-8765', 'michael.johnson@example.com', '789 Pine St'),
('Emily', 'Davis', '555-4321', 'emily.davis@example.com', '321 Maple St'),
('Chris', 'Brown', '555-6789', 'chris.brown@example.com', '654 Birch St'),
('Amanda', 'Taylor', '555-1111', 'amanda.taylor@example.com', '111 Cedar St'),
('David', 'Wilson', '555-2222', 'david.wilson@example.com', '222 Spruce St'),
('Sarah', 'Anderson', '555-3333', 'sarah.anderson@example.com', '333 Walnut St'),
('Brian', 'Martinez', '555-4444', 'brian.martinez@example.com', '444 Chestnut St'),
('Laura', 'White', '555-5555', 'laura.white@example.com', '555 Redwood St');

INSERT INTO Cars (Make, Model, YearMade, VIN, Price, CarStatus) VALUES
('Toyota', 'Camry', 2022, '1HGCM82633A123456', 25000.00, TRUE),
('Honda', 'Civic', 2021, '2HGFC2F69MH512345', 22000.00, TRUE),
('Ford', 'Mustang', 2020, '1FA6P8TH5L5101234', 30000.00, TRUE),
('Chevrolet', 'Malibu', 2019, '1G1ZD5ST0KF123456', 20000.00, TRUE),
('Nissan', 'Altima', 2023, '1N4BL4CV3PN123456', 27000.00, TRUE),
('BMW', '3 Series', 2022, 'WBA8E1G56JNU12345', 40000.00, TRUE),
('Audi', 'A4', 2021, 'WAUENAF48JN123456', 39000.00, TRUE),
('Tesla', 'Model 3', 2023, '5YJ3E1EA8KF123456', 50000.00, TRUE),
('Jeep', 'Wrangler', 2020, '1C4HJXDG3LW123456', 35000.00, TRUE),
('Hyundai', 'Sonata', 2022, '5NPE24AF6KH123456', 24000.00, TRUE);

INSERT INTO Managers (ManagerID, FirstName, LastName, PhoneNumber, Email) VALUES
(1, 'Mark', 'Stevens', '555-7777', 'mark.stevens@example.com'),
(2, 'Nancy', 'Thompson', '555-8888', 'nancy.thompson@example.com'),
(3, 'Paul', 'Rodriguez', '555-9999', 'paul.rodriguez@example.com');

INSERT INTO Salespersons (FirstName, LastName, PhoneNumber, Email, HireDate, ManagerID) VALUES
('Tom', 'Harris', '555-1010', 'tom.harris@example.com', '2018-06-12', 1),
('Alice', 'Walker', '555-2020', 'alice.walker@example.com', '2019-08-25', 1),
('Jake', 'Miller', '555-3030', 'jake.miller@example.com', '2020-05-18', 2),
('Sophia', 'Lee', '555-4040', 'sophia.lee@example.com', '2021-07-09', 2),
('Daniel', 'Adams', '555-5050', 'daniel.adams@example.com', '2017-03-22', 3),
('Megan', 'Clark', '555-6060', 'megan.clark@example.com', '2016-12-15', 3),
('Samuel', 'Baker', '555-7070', 'samuel.baker@example.com', '2019-04-30', 1),
('Olivia', 'Phillips', '555-8080', 'olivia.phillips@example.com', '2022-02-14', 2),
('Noah', 'Carter', '555-9090', 'noah.carter@example.com', '2023-01-20', 3),
('Liam', 'Evans', '555-1112', 'liam.evans@example.com', '2020-09-10', 1);

-- 5. ADVANCED DATABASE OBJECTS
-- A View for easier reporting
CREATE OR REPLACE VIEW View_SalesSummary AS
SELECT 
    s.SaleID,
    s.SaleDate,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    CONCAT(cars.Make, ' ', cars.Model) AS CarSold,
    s.SalePrice,
    CONCAT(sp.FirstName, ' ', sp.LastName) AS Salesperson
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
JOIN Cars cars ON s.CarID = cars.CarID
JOIN Salespersons sp ON s.SalespersonID = sp.SalespersonID;

-- A Trigger to prevent negative pricing
DELIMITER //
CREATE TRIGGER Before_Sale_Insert
BEFORE INSERT ON Sales
FOR EACH ROW
BEGIN
    IF NEW.SalePrice < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Sale price cannot be negative.';
    END IF;
END //
DELIMITER ;

-- A Stored Procedure to handle a Sale and update Car Status at once
DELIMITER //
CREATE PROCEDURE ProcessSale(
    IN p_CustomerID INT,
    IN p_CarID INT,
    IN p_SalespersonID INT,
    IN p_SalePrice DECIMAL(10,2)
)
BEGIN
    INSERT INTO Sales (CustomerID, CarID, SalespersonID, SaleDate, SalePrice)
    VALUES (p_CustomerID, p_CarID, p_SalespersonID, CURDATE(), p_SalePrice);

    UPDATE Cars SET CarStatus = FALSE WHERE CarID = p_CarID;
END //
DELIMITER ;

-- 6. ANALYTICAL QUERIES
-- "How many cars are currently available for sale?"
SELECT COUNT(*) AS AvailableCars FROM Cars WHERE CarStatus = TRUE;

-- "Who are the managers and how many salespeople report to each?"
SELECT Managers.FirstName, Managers.LastName, COUNT(Salespersons.SalespersonID) AS SalespersonCount
FROM Managers
JOIN Salespersons ON Managers.ManagerID = Salespersons.ManagerID
GROUP BY Managers.ManagerID;

-- "Show me the top individual sale using the Summary View"
SELECT * FROM View_SalesSummary ORDER BY SalePrice DESC LIMIT 1;