CREATE TABLE hub_customer (
contract_hk BIGINT NOT NULL REFERENCES hub_contract(contract_hk),
car_hk BIGINT NOT NULL REFERENCES hub_car(car_hk),
load_dts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
record_source VARCHAR(50) NOT NULL
);

CREATE TABLE link_contract_manager (
link_hk BIGSERIAL PRIMARY KEY,
contract_hk BIGINT NOT NULL REFERENCES hub_contract(contract_hk),
manager_hk BIGINT NOT NULL REFERENCES hub_manager(manager_hk),
load_dts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
record_source VARCHAR(50) NOT NULL
);

-- =====================
-- SATELLITES
-- =====================

CREATE TABLE sat_customer (
customer_hk BIGINT NOT NULL REFERENCES hub_customer(customer_hk),
last_name VARCHAR(100),
first_name VARCHAR(100),
email VARCHAR(100),
load_dts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
record_source VARCHAR(50) NOT NULL,
PRIMARY KEY (customer_hk, load_dts)
);

CREATE TABLE sat_car (
car_hk BIGINT NOT NULL REFERENCES hub_car(car_hk),
model VARCHAR(100),
color VARCHAR(50),
production_year INTEGER,
status VARCHAR(30),
load_dts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
record_source VARCHAR(50) NOT NULL,
PRIMARY KEY (car_hk, load_dts)
);

CREATE TABLE sat_manager (
manager_hk BIGINT NOT NULL REFERENCES hub_manager(manager_hk),
last_name VARCHAR(100),
first_name VARCHAR(100),
hire_date DATE,
load_dts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
record_source VARCHAR(50) NOT NULL,
PRIMARY KEY (manager_hk, load_dts)
);

CREATE TABLE sat_contract (
contract_hk BIGINT NOT NULL REFERENCES hub_contract(contract_hk),
contract_date DATE,
total_price NUMERIC(12,2),
load_dts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
record_source VARCHAR(50) NOT NULL,
PRIMARY KEY (contract_hk, load_dts)
);

CREATE TABLE sat_payment (
contract_hk BIGINT NOT NULL REFERENCES hub_contract(contract_hk),
payment_date DATE,
amount NUMERIC(12,2),
payment_method VARCHAR(50),
load_dts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
record_source VARCHAR(50) NOT NULL,
PRIMARY KEY (contract_hk, load_dts)
);
