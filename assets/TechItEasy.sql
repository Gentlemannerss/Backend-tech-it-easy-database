DROP TABLE if EXISTS users;
DROP TABLE IF EXISTS television_wall_bracket;
DROP TABLE if EXISTS remote_controller CASCADE;
DROP TABLE if EXISTS television CASCADE;
DROP TABLE if EXISTS ci_module;
DROP TABLE if EXISTS wall_bracket;


CREATE TABLE remote_controller(
	id int generated always as identity,
	name varchar(255) not null unique,
	brand varchar(255) not null,
	price double precision,
	current_stock int,
	sold int,
	compatible_with varchar(255),
	battery_type varchar(255),
	primary key (id)
);

CREATE TABLE ci_module(
	id int generated always as identity,
	name varchar(255) not null unique,
	brand varchar(255) not null,
	price double precision,
	current_stock int,
	sold int,
	primary key (id)
);

CREATE TABLE wall_bracket(
	id int generated always as identity,
	name varchar(255) not null unique,
	brand varchar(255) not null,
	price double precision,
	current_stock int,
	sold int,
	adjustable boolean,
	primary key (id)
);

CREATE TABLE television(
	id int GENERATED ALWAYS AS IDENTITY,
	name varchar(255) NOT NULL UNIQUE,
	brand varchar(255) NOT NULL,
	price DOUBLE PRECISION,
	current_stock INT,
	sold INT,
	type varchar(255),
	available INT,
	refresh_rate INT,
	screen_type varchar(255),
		remote_id int,
		ci_module_id INT,
		PRIMARY KEY (id),
		CONSTRAINT fk_remote_controller FOREIGN KEY (remote_id) REFERENCES remote_controller (id),
		CONSTRAINT fk_cimodule FOREIGN KEY (ci_module_id) REFERENCES ci_module (id)
);

create table users(
	username varchar(255) not null unique,
	password varchar(255) not null
);

CREATE TABLE television_wall_bracket(
television_id INT,
wall_bracket_id INT,
CONSTRAINT fk_television FOREIGN KEY (television_id) REFERENCES television (id),
CONSTRAINT fk_wall_bracket FOREIGN KEY (wall_bracket_id) REFERENCES wall_bracket (id)
);

INSERT INTO television (name, brand, price, current_stock, sold, type, available, refresh_rate, screen_type, remote_id)
VALUES
('Samsung ledTV', 'Samsung', 1000.00, 10, 0, 'LED', 1, 60, 'Flat', 1),
('LG BRAVO', 'LG', 900.00, 15, 5, 'OLED', 0, 120, 'Curved', 2),
('Sony viewport', 'Sony', 1200.00, 8, 2, 'LED', 1, 60, 'Flat', 3),
('Thosiba curved', 'Toshiba', 800.00, 20, 10, 'LCD', 1, 120, 'Curved', 4),
('Samsung OledTV', 'Samsung', 1100.00, 12, 3, 'OLED', 0, 60, 'Flat', 5);

INSERT INTO remote_controller (name, brand, price, current_stock, sold, compatible_with, battery_type)
VALUES
('Remote 1', 'Samsung', 50.00, 20, 5, 'TV Models 1-3', 'AA'),
('Remote 2', 'LG', 60.00, 15, 10, 'TV Models 4-6', 'AAA'),
('Remote 3', 'Sony', 70.00, 18, 7, 'TV Models 7-9', 'AA');

INSERT INTO wall_bracket (name, brand, price, current_stock, sold, adjustable)
VALUES
('LG small', 'LG bracket', 32.23, 20, 5, false),
('LG big', 'LG bracket', 32.23, 15, 10, true),
('Philips small', 'Philips bracket', 32.23, 18, 7, false),
('Nikkei big', 'Nikkei bracket', 32.23, 22, 2, true),
('Nikkei small', 'Nikkei bracket', 32.23, 25, 5, false);

INSERT INTO ci_module (name, brand, price, current_stock, sold)
VALUES
('universal CI-module', 'Philips', 30.00, 10, 5);

INSERT INTO television_wall_bracket (television_id, wall_bracket_id)
VALUES
('1', '1');