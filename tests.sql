-- Add dealerships for testing.
INSERT INTO dealerships (dealership_id, name, address, phone) VALUES (1, 'Auto Plaza', '123 Elm Street', '555-1234'), (2, 'Car Town', '456 Maple Avenue', '555-5678'), (3, 'Dealership One', '789 Oak Blvd', '555-9012');

-- Add vehicles for testing.
INSERT INTO vehicles (manufacture, model, color, type, vin) VALUES
('Ford', 'Mustang', 'Red', 'Coupe', '1FTFW1E12JFB74567'),
('Chevrolet', 'Camaro', 'Blue', 'Coupe', '2G1FK1EJ7B9133456'),
('Toyota', 'Corolla', 'White', 'Sedan', 'JT2BG12K6V0501334'),
('Honda', 'Civic', 'Black', 'Sedan', '19XFC2F59GE200004');

-- Add inventory for testing.
INSERT INTO inventory (dealership_id, vin) VALUES  (1, '1FTFW1E12JFB74567'), (2, '2G1FK1EJ7B9133456'), (3, 'JT2BG12K6V0501334'), (4, '19XFC2F59GE200004');

-- Add sales contract for testing.
INSERT INTO sales_contracts (id, vin, totalamount, rate, totalmonths, date) VALUES
(1, '1FTFW1E12JFB74567', 30000, 3.5, 60, '2023-01-15'),
(2, '2G1FK1EJ7B9133456', 35000, 3.0, 60, '2023-02-20'),
(3, 'JT2BG12K6V0501334', 20000, 4.0, 48, '2023-03-25'),
(3, '19XFC2F59GE200004', 22000, 3.8, 48, '2023-04-30');

-- Get all dealerships.
Select * FROM dealerships;

-- Find all vehicles for a specific dealership.
SELECT vehicles.* FROM vehicles INNER JOIN inventory ON vehicles.vin = inventory.vin WHERE inventory.dealership_id = 1;

-- Find car by VIN.
SELECT * FROM vehicles WHERE vin = '1FTFW1E12JFB74567';

-- Find the dealership where a certain car is located by VIN.
SELECT dealerships.* FROM dealerships INNER JOIN inventory ON dealerships.dealership_id = inventory.dealership_id WHERE inventory.vin = '1FTFW1E12JFB74567';

-- Find all dealerships that have a certain car type.
SELECT dealerships.* FROM dealerships 
INNER JOIN inventory ON dealerships.dealership_id = inventory.dealership_id 
INNER JOIN vehicles ON inventory.vin = vehicles.vin WHERE vehicles.color = 'Red' AND vehicles.manufacture = 'Ford' AND vehicles.model = 'Mustang';

-- Get all sales information for a specific dealer for a specific date range.
SELECT sales_contracts.* FROM sales_contracts
INNER JOIN dealerships ON sales_contracts.id = dealerships.dealership_id
WHERE dealerships.name = 'Auto Plaza' AND sales_contracts.date >= '2023-01-10' AND sales_contracts.date <= '2023-01-20';