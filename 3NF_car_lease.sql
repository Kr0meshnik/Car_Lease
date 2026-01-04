CREATE TABLE Manufacturer (
manufacturer_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
country VARCHAR(100) NOT NULL
);

CREATE TABLE Model (
model_id SERIAL PRIMARY KEY,
manufacturer_id INTEGER NOT NULL REFERENCES Manufacturer(manufacturer_id),
model_name VARCHAR(100) NOT NULL,
engine_type VARCHAR(50) NOT NULL,
base_price NUMERIC(12,2) NOT NULL
);

CREATE TABLE Car (
car_id SERIAL PRIMARY KEY,
model_id INTEGER NOT NULL REFERENCES Model(model_id),
vin VARCHAR(17) NOT NULL UNIQUE,
color VARCHAR(50) NOT NULL,
production_year INTEGER NOT NULL,
status VARCHAR(20) NOT NULL
);

CREATE TABLE Customer (
customer_id SERIAL PRIMARY KEY,
last_name VARCHAR(100) NOT NULL,
first_name VARCHAR(100) NOT NULL,
phone VARCHAR(20) NOT NULL,
email VARCHAR(100)
);

CREATE TABLE SalesManager (
manager_id SERIAL PRIMARY KEY,
last_name VARCHAR(100) NOT NULL,
first_name VARCHAR(100) NOT NULL,
hire_date DATE NOT NULL
);

CREATE TABLE SaleContract (
contract_id SERIAL PRIMARY KEY,
car_id INTEGER NOT NULL REFERENCES Car(car_id),
customer_id INTEGER NOT NULL REFERENCES Customer(customer_id),
manager_id INTEGER NOT NULL REFERENCES SalesManager(manager_id),
contract_date DATE NOT NULL,
total_price NUMERIC(12,2) NOT NULL
);

CREATE TABLE Payment (
payment_id SERIAL PRIMARY KEY,
contract_id INTEGER NOT NULL REFERENCES SaleContract(contract_id),
payment_date DATE NOT NULL,
amount NUMERIC(12,2) NOT NULL,
payment_method VARCHAR(50) NOT NULL
);
