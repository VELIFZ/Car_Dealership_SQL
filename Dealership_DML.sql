-- Add data to Salesperson table
INSERT INTO salesperson(
	first_name,
	last_name,
	email,
	phone_number
) VALUES (
	'Zambak',
	'Erik',
	'zambak@gmail.com',
	'(555) 218 6565'
);

INSERT INTO salesperson(
	first_name,
	last_name,
	email,
	phone_number
) VALUES (
    'Lilo',
    'Can',
    'lilocan@gmail.com',
    '(536) 452 1126'
),( 'Foxy',
    'Cleopatra',
    'Cleopatra@gmail.com',
    '(533) 213 3821'
);

-- add to car table 
INSERT INTO car(
	make,
	model,
	year_,
	color,
	is_used,
	seller_id 
) VALUES (
	'x',
	'RAV4',
	'2021',
	'Black',
	FALSE,
	1
);

-- 'x' yerine 'toyota'
select * from car;
-- Update data in a table
update car -- update <table>
set make = 'Toyota' -- set <column> = '...'
where serial_number = 1;

INSERT INTO car(
    make,
	model,
	year_,
	color,
	is_used,
	seller_id
) VALUES ('BMW', 'M4', '2018', 'White', TRUE, 2), 
         ('AUDI', 'R8', '2022', 'Silver', TRUE, 3);

        
-- Add data to customer table 
INSERT INTO customer(
	first_name,
	last_name,
	email,
	address,
	phone_number,
	serial_number
) VALUES ('Sabriye', 'Coban', 'sabriye@gmail.com', '723 Deli Drive', '(423) 943 6930', 1), 
         ('Esra', 'Karakoc', 'ekarakoc@gmail.com', '213 Bilmemne Avenue', '(973) 719 7542', 2),
         ('Emel', 'Kedi', 'kedicik@gmail.com', '457 Alaca Avenue', '(517) 029 0124', 3); -- bunun id'si 4 niye bilmiyorum


-- Invoice
  INSERT INTO invoice(
	price_of_car,
	seller_id,
	customer_id,
	serial_number
) VALUES (45999.99, 1, 3, 1), 
         (20999.99, 3, 2, 2),
         (60999.99, 1, 4, 3);

-- start invoice_id from 1. Right now it's starting from 10 
ALTER SEQUENCE invoice_invoice_id_seq
RESTART WITH 1;
       
-- mechanic
INSERT INTO mechanic(
	first_name,
	last_name
) VALUES ('Saadet', 'Aslan'),
         ('Kamil', 'Koc');
 
        
-- Service, FK- serial_number, mechanic_id
INSERT INTO service(
	service_description,
	service_charge, -- + should I ADD up part_price AND service charge 
	--drop_oof,
	--pick_up,
	serial_number,
	mechanic_id 
) VALUES ('XY part need to change', 9.99, 3, 2), 
         ('Fancy oil change', 50.00, 2, 2),
         ('Battery replacement', 5.00, 1, 1);  
SELECT * FROM parts 

-- parts, FK-service_id
INSERT INTO parts(
	part_name,
	part_price,
	quantity, 
	service_id 
) VALUES ('XY', 99.99, 1, 1),
         ('Battery', 99.00, 1, 3);  
