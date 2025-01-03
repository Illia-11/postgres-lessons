/*
  ALTER TABLE - використовується для внесення змін структури в існуючу таблицю
  без її видалення та втрати даних
*/
-- додавання стовпчика
ALTER TABLE users 
ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT current_timestamp;
-- видалення стовпчика
ALTER TABLE users 
DROP COLUMN height;
-- додавання омеження
-- звичайні обмеження:
ALTER TABLE users 
ADD CHECK (created_at > '1900-01-01')
-- або
ALTER TABLE users 
ADD CONSTRAINT "якась назва" CHECK (created_at > '1900-01-01');
-- NOT NULL
ALTER TABLE users 
ALTER COLUMN is_male SET NOT NULL;
-- видалення обмеження
-- звичайні обмеження:
ALTER TABLE users 
DROP CONSTRAINT "якась назва";
-- видалення NOT NULL
ALTER TABLE users 
ALTER COLUMN is_male DROP NOT NULL;
-- зміна значення за замовчанням
ALTER TABLE users 
ALTER COLUMN account_balance SET DEFAULT 100;
-- прибрати значення за замовчанням
-- варіант 1:
ALTER TABLE users 
ALTER COLUMN account_balance SET DEFAULT NULL;
-- варіант 2:
ALTER TABLE users 
ALTER COLUMN account_balance DROP DEFAULT NULL;
-- зміна типу даних стовпчика
ALTER TABLE users 
ALTER COLUMN id TYPE bigint;
-- перейменування стовпчика
ALTER TABLE users 
RENAME COLUMN account_balance TO balance;
-- перейменування таблиці
ALTER TABLE users 
RENAME TO humans;
-- В одному алтері можна поєднувати декілька різних змін
ALTER TABLE humans 
ADD COLUMN updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
DROP COLUMN last_name;