/*
  Види звʼязків сутностей у БД:

    1 : 1 - один до одного
      (у 1 країни є 1 прапор, у 1 прапора 1 країна)
      (1 користувачі відповідає 1 запис даних користувача, 1 запис користувача належить 1 користувачу)

    1 : m - один до багатьох
      (в одній групі багато студентів, у 1 студента буде 1 група)
      (у книжки 1 автор, у автора багато книжок)

    n : m - багато до багатьох
      (в одному чаті багато людей, конкретний користувач теж має багато чатів)
      (в одному замовленні може бути багато товарів, товар може знаходитися в багатьох замовленнях)

    По жорсткості звʼязку (по обовʼязковості):
      Жорсткі - запис обовʼязково повʼязаний з записом у іншій таблиці (1)
      Нежорсткі - запис НЕобовʼязково повʼязаний з записом у іншій таблиці (0)

    По кількості таблиці у звʼязку%
      Унарні звʼязки (запис з таблиці посилається на інший запис з цієї ж таблиці)
      Бінарний звʼязок (дві таблиці у звʼязку)
      Тернарний звʼязок
      ...
*/
-- @block 1 : m
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
-- 
CREATE TABLE IF NOT EXISTS orders(
  id SERIAL PRIMARY KEY,
  -- user_id INT NOT NULL REFERENCES users (id),
  user_id INT NOT NULL REFERENCES users,
  updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);
-- @block n : m
-- робиться за допомогою "звʼязувальної таблиці"
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
-- звʼязувальна таблиця
CREATE TABLE IF NOT EXISTS products_to_orders (
  product_id INT NOT NULL REFERENCES products,
  order_id INT NOT NULL REFERENCES orders,
  quantity INT,
  PRIMARY KEY (product_id, order_id)
);
-- @block 0 : 1 (нежорстка версія)
CREATE TABLE IF NOT EXISTS country_1 (
  id SERIAL PRIMARY KEY,
  -- anthem_id INT UNIQUE REFERENCES anthem_1,
  "name" TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);
--
CREATE TABLE IF NOT EXISTS anthem_1 (
  id SERIAL PRIMARY KEY,
  country_id INT NOT NULL REFERENCES country_1 UNIQUE,
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);
--
ALTER TABLE country_1
ADD COLUMN anthem_id INT UNIQUE REFERENCES anthem_1;
-- @block 1 : 1 (жорстка версія)
CREATE TABLE IF NOT EXISTS country_2 (
  id SERIAL PRIMARY KEY,
  -- anthem_id INT UNIQUE REFERENCES anthem_1,
  "name" TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);
--
CREATE TABLE IF NOT EXISTS anthem_2 (
  id SERIAL PRIMARY KEY,
  country_id INT NOT NULL REFERENCES country_2 UNIQUE,
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);
--
ALTER TABLE country_2
ADD COLUMN anthem_id INT NOT NULL UNIQUE REFERENCES anthem_2;