/**
 * Fit Fuel V1 Migration
 *
 * This is the migration for v1 of the FitFuel API
 * This SQL is meant to be run w/ goose on a PSQL DB
 *
 * @package     FitFuel
 * @author      Salvatore D'Agostino
 * @copyright   Copyright (c) 2014, Salvatore D'Agostino.
 **/

-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied
/* SQLEditor (Postgres)*/

/* SQLEditor (Postgres)*/

CREATE TABLE resources
(
id SERIAL NOT NULL UNIQUE,
name VARCHAR(255) UNIQUE,
created_at TIMESTAMP,
updated_at TIMESTAMP,
deleted_at TIMESTAMP,
PRIMARY KEY (id)
);

CREATE TABLE users
(
id SERIAL NOT NULL,
username VARCHAR(255) NOT NULL UNIQUE,
password VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
first_name VARCHAR(255),
last_name VARCHAR(255),
created_at TIMESTAMP,
updated_at TIMESTAMP,
deleted_at TIMESTAMP,
PRIMARY KEY (id)
);

CREATE TABLE fit_fuel
(
id SERIAL NOT NULL UNIQUE,
user_id INTEGER NOT NULL,
total_in BIGINT,
total_out BIGINT,
created_at TIMESTAMP,
updated_at TIMESTAMP,
deleted_at TIMESTAMP,
PRIMARY KEY (id)
);

CREATE TABLE users_resources
(
id INTEGER,
user_id INTEGER NOT NULL,
resource_id INTEGER NOT NULL,
api_token VARCHAR(255),
secret VARCHAR(255),
created_at TIMESTAMP,
updated_at TIMESTAMP,
deleted_at TIMESTAMP
);

CREATE INDEX resources_id_idx ON resources(id);

CREATE INDEX users_username_idx ON users(username);

CREATE INDEX users_email_idx ON users(email);

CREATE INDEX fit_fuel_id_idx ON fit_fuel(id);

ALTER TABLE fit_fuel ADD FOREIGN KEY (user_id) REFERENCES users (id);

ALTER TABLE users_resources ADD FOREIGN KEY (user_id) REFERENCES users (id);

ALTER TABLE users_resources ADD FOREIGN KEY (resource_id) REFERENCES resources (id);

-- +goose Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE users_resources;
DROP TABLE fit_fuel;
DROP TABLE users;
DROP TABLE resources;