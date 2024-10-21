Create database supply_chain
use supply_chain

select * from supply_chain_data
------------------------------------split the data into multiple tables---------------------------------
CREATE TABLE Products (
    SKU VARCHAR(50) PRIMARY KEY,
    ProductType VARCHAR(50),
    Price FLOAT,
    StockLevels INT,
    Availability INT,
    LeadTimes INT,
    OrderQuantities INT)

CREATE TABLE Sales (
    SKU VARCHAR(50) PRIMARY KEY,
    NumberOfProductsSold INT,
    RevenueGenerated FLOAT,
    CustomerDemographics VARCHAR(50),
    ShippingTimes INT,
    ShippingCosts FLOAT,
    FOREIGN KEY (SKU) REFERENCES Products(SKU))

CREATE TABLE Suppliers (
    SKU VARCHAR(50) PRIMARY KEY,
    SupplierName VARCHAR(50),
    Location VARCHAR(50),
    LeadTime INT,
    ProductionVolumes INT,
    ManufacturingLeadTime INT,
    ManufacturingCosts FLOAT)

CREATE TABLE Inspections (
    SKU VARCHAR(50) PRIMARY KEY,
    InspectionResults VARCHAR(50),
    DefectRates FLOAT,
    FOREIGN KEY (SKU) REFERENCES Products(SKU))

CREATE TABLE Shipping (
    SKU VARCHAR(50) PRIMARY KEY,
    ShippingCarriers VARCHAR(50),
    TransportationModes VARCHAR(50),
    Routes VARCHAR(50),
    Costs FLOAT,
    FOREIGN KEY (SKU) REFERENCES Products(SKU))
------------------------------------------------Inserting data into tables -------------------------------------------------

-- Inserting data into Products table from supply_chain_data

INSERT INTO Products (SKU, ProductType, Price, StockLevels, Availability, LeadTimes, OrderQuantities)
SELECT SKU, Product_type, Price, Stock_levels, Availability, lead_time, Order_quantities
FROM supply_chain_data

select * from Products


-- Inserting data into Sales table from supply_chain_data

INSERT INTO Sales (SKU, NumberOfProductsSold, RevenueGenerated, CustomerDemographics, ShippingTimes, ShippingCosts)
SELECT SKU, Number_of_products_sold, Revenue_generated, Customer_demographics, Shipping_times, Shipping_costs
FROM supply_chain_data

select * from Sales

-- Inserting data into Suppliers table from supply_chain_data

INSERT INTO Suppliers (SKU,SupplierName, Location, LeadTime, ProductionVolumes, ManufacturingLeadTime, ManufacturingCosts)
SELECT SKU,Supplier_name, Location, Lead_time, Production_volumes, Manufacturing_lead_time, Manufacturing_costs
FROM supply_chain_data

select * from Suppliers

-- Inserting data into Inspections table from supply_chain_data

INSERT INTO Inspections (SKU, InspectionResults, DefectRates)
SELECT SKU, Inspection_results, Defect_rates
FROM supply_chain_data

select * from Inspections

-- Inserting data into Shipping table from supply_chain_data

INSERT INTO Shipping (SKU, ShippingCarriers, TransportationModes, Routes, Costs)
SELECT SKU, Shipping_carriers, Transportation_modes, Routes, Costs
FROM supply_chain_data

select * from Shipping

------------------------------------------------Inserting data into tables -------------------------------------------------
select * from Inspections
select * from Products
select * from Sales
select * from Shipping
select * from Suppliers