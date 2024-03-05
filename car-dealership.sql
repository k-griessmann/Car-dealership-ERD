create or replace function add_customer(
	_customer_id INTEGER, 
	_first_name VARCHAR, 
	_last_name VARCHAR, 
	_phone VARCHAR,
	_email VARCHAR
)
returns void
as $MAIN$
begin 
	insert into customer(customer_id, first_name, last_name, phone, email)
	VALUES(_customer_id, _first_name, _last_name, _phone, _email);
end;
$MAIN$
language plpgsql;

select add_customer(1, 'Ben', 'Wyatt', '555-555-5555', 'bwyatt@email.com');
select add_customer(2, 'Leslie', 'Knope', '555-867-5309', 'lknope@aol.com');

-- salesperson stored function 
create or replace function add_salesperson(
	_salesperson_id INTEGER, 
	_first_name VARCHAR, 
	_last_name VARCHAR 
)
returns void
as $MAIN$
begin 
	insert into salesperson(salesperson_id, first_name, last_name)
	values(_salesperson_id, _first_name, _last_name);
end;
$MAIN$
language plpgsql;

select add_salesperson(1, 'Dwight', 'Schrute');
select add_salesperson(2, 'Michael', 'Scott');

-- mechanic insert
insert into mechanic(mechanic_id, first_name, last_name)
VALUES(1,'Jake','Peralta');

insert into mechanic(mechanic_id,first_name,last_name)
VALUES(2,'Amy','Santiago');

-- vehicle insert
insert into car(
	serial_number,
	make,
	model,
	year
)VALUES(
	'565d4f84548d',
	'Ford',
	'F250', 
	1996
);

insert into car(
	serial_number,
	make,
	model,
	year
)VALUES(
	'95847p25k565k',
	'Toyota',
	'4runner', 
	2006
);

-- invoice insert
insert into invoice(
	invoice_id,
	price,
	serial_number,
	customer_id,
	salesperson_id
)VALUES(
	1,
	100000.00,
	'565d4f84548d',
	1,
	1
);

insert into invoice(
	invoice_id,
	price,
	serial_number,
	customer_id,
	salesperson_id
)VALUES(
	2,
	300000.00,
	'95847p25k565k',
	2,
	2
);

select * from invoice;

-- service_ticket insert
insert into service_ticket(
	ticket_id,
	cost,
	serial_number,
	customer_id
)VALUES(
	1,
	5000.00,
	'565d4f84548d',
	2
);

insert into service_ticket(
	ticket_id,
	cost,
	serial_number,
	customer_id
)VALUES(
	2,
	7000.00,
	'95847p25k565k',
	1
);

-- service_history junction table insert
insert into service_history(
	event_id,
	event_description,
	ticket_id,
	mechanic_id,
	serial_number
)VALUES(
	1,
	'Changed oil and air filter',
	1,
	1,
	'565d4f84548d'
);

insert into service_history(
	event_id,
	event_description,
	ticket_id,
	mechanic_id,
	serial_number
)VALUES(
	2,
	'Replaced a/c compressor',
	2,
	2,
	'95847p25k565k'
);


-- part table insert
insert into part(
	part_id,
	description,
	ticket_id
)VALUES(
	1,
	'air filter',
	1
);

insert into part(
	part_id,
	description,
	ticket_id
)VALUES(
	2,
	'a/c compressor',
	1
);