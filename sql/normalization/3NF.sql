-- 3 Нормальна форма
/*
  Нормальна Функціональна Залежність
    id > attr1
    id > attr2

  Транзитивна Функціональна Залежність
    id > attr1 > attr2
*/
-- @block відношення НЕ у 3 НФ
CREATE TABLE workers (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  departament TEXT,
  departament_phone_number TEXT
);
--
INSERT INTO workers
(first_name, last_name, departament, departament_phone_number)
VALUES
('1', '2', 'IT', '11111111111'),
('2', '3', 'IT', '11111111222');
-- @block відношення у 3 НФ
CREATE TABLE departaments (
  id SERIAL PRIMARY KEY,
  departament TEXT,
  departament_phone_number TEXT
);

CREATE TABLE workers (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  departament_id INT REFERENCES departaments
);
--
INSERT INTO departaments
(departament, departament_phone_number)
VALUES
('IT', '11111111111'),
('HR', '22222222222');
--
INSERT INTO workers
(first_name, last_name, departament_id)
VALUES
('1', '2', 1),
('2', '3', 2);