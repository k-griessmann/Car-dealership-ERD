-- customer table creation
create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone VARCHAR(12),
	email VARCHAR(100)
);

-- salesperson table creation
create table salesperson(
	salesperson_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);


-- mechanic table creation
create table mechanic(
	mechanic_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);


-- vehicle table creation
create table car(
	serial_number VARCHAR(150) primary key,
	make VARCHAR(100),
	model VARCHAR(100),
	year integer
);

-- invoice table creation
create table invoice(
	invoice_id SERIAL primary key,
	price NUMERIC(8, 2),
	serial_number VARCHAR(150) not NULL,
	customer_id INTEGER not NULL,
	salesperson_id INTEGER NOT NULL,
	foreign key(serial_number) references car(serial_number),
	foreign key(customer_id) references customer(customer_id),
	foreign key(salesperson_id) references salesperson(salesperson_id)
);

-- service_ticket table creation
create table service_ticket(
	ticket_id SERIAL primary key,
	cost NUMERIC(8,2),
	serial_number VARCHAR(150) NOT NULL,
	customer_id INTEGER NOT NULL,
	foreign key(serial_number) references car(serial_number),
	foreign key(customer_id) references customer(customer_id)
);

-- service_history junction table creation
create table service_history(
	event_id SERIAL primary key,
	event_description VARCHAR(400),
	ticket_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL,
	serial_number VARCHAR(150) not NULL,
	foreign key(ticket_id) references service_ticket(ticket_id),
	foreign key(mechanic_id) references mechanic(mechanic_id),
	foreign key(serial_number) references car(serial_number)
);

-- part table creation
create table part(
	part_id SERIAL PRIMARY key,
	description VARCHAR(250),
	ticket_id INTEGER,
	foreign key(ticket_id) references service_ticket(ticket_id)
);
