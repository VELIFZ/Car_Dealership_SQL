-- maybe replace seller_id to customer_id as a foreign key in car table?
-- then where seller_id will go?


-- Salesperson table  no FK 
CREATE TABLE salesperson(
    seller_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(15)
);

-- Car table, FK -seller_id 
CREATE TABLE car(
    serial_number SERIAL PRIMARY KEY,
    make VARCHAR(15),
    model VARCHAR(15),
    year_ VARCHAR(10),
    color VARCHAR(15),
    is_used BOOLEAN,
    seller_id INTEGER NOT NULL,
    FOREIGN KEY(seller_id) REFERENCES salesperson(seller_id)
);

-- Customer table, FK -serial_number
CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    address VARCHAR(100),
    phone_number VARCHAR(15),
    serial_number INTEGER NOT NULL,
    FOREIGN KEY(serial_number) REFERENCES car(serial_number)
);

-- Invoice table, FK- seller_id, serial_number, customer_id 
CREATE TABLE invoice(
    invoice_id SERIAL PRIMARY KEY,
    price_of_car NUMERIC(8,2),
    invocie_date DATE DEFAULT CURRENT_DATE,
    seller_id INTEGER NOT NULL,
    FOREIGN KEY(seller_id) REFERENCES salesperson(seller_id),
    customer_id INTEGER NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    serial_number INTEGER NOT NULL,
    FOREIGN KEY(serial_number) REFERENCES car(serial_number)   
);

-- service table, FK- serial_number, mechanic_id
CREATE TABLE service(
    service_id SERIAL PRIMARY KEY,
    service_description VARCHAR(200),
    service_charge NUMERIC(4,2),
    drop_off DATE DEFAULT CURRENT_DATE,
    pick_up DATE DEFAULT CURRENT_DATE,
    serial_number INTEGER NOT NULL,
    FOREIGN KEY(serial_number) REFERENCES car(serial_number)
);

-- mechanic table
CREATE TABLE mechanic(
    mechanic_id  SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- add mechanic_id FK in service table
ALTER TABLE service
ADD COLUMN mechanic_id INTEGER NOT NULL,
ADD FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id);

-- parts table, FK service_id 
CREATE TABLE parts(
    part_id SERIAL PRIMARY KEY,
    part_name VARCHAR(50),
    part_price NUMERIC(4,2),
    quantity INTEGER,
    service_id INTEGER NOT NULL,
    FOREIGN KEY(service_id) REFERENCES service(service_id)
);