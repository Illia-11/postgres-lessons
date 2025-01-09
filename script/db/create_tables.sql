-- @block
CREATE TABLE IF NOT EXISTS users(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(64) NOT NULL CHECK (first_name != ''),
  last_name VARCHAR(64) NOT NULL,
  email VARCHAR(256) NOT NULL 
  CONSTRAINT "email must be unique" UNIQUE 
  CONSTRAINT "not empty email" CHECK (email != ''),
  account_balance NUMERIC(11,2) DEFAULT 0.00 CHECK (account_balance >= 0),
  height NUMERIC(3,2) NOT NULL CHECK(height >= 0.5 AND height <= 3),
  is_male BOOLEAN,
  birthday DATE CHECK (birthday > '1890-01-01' AND birthday <= current_date),
  updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  CONSTRAINT "only unique combination of first and last name allowed" UNIQUE (first_name, last_name),
  CHECK (last_name != '')
);
-- @block
CREATE TABLE IF NOT EXISTS products(
  id SERIAL PRIMARY KEY,
  "name" VARCHAR(100),
  price NUMERIC(9,2) NOT NULL CHECK (price >= 0),
  quantity INT NOT NULL CHECK (quantity >= 0),
  category VARCHAR(100) NOT NULL CHECK (category != ''),
  is_for_adult BOOLEAN DEFAULT FALSE,
  updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);
-- @block
CREATE TABLE IF NOT EXISTS orders(
  id SERIAL PRIMARY KEY,
  updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);