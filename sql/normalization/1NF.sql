-- 1 Нормальна форма
-- @block таблиця НЕ у 1 НФ
CREATE TABLE users (
  first_name TEXT,
  last_name TEXT
);
-- @block таблиця у 1 НФ
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT
);