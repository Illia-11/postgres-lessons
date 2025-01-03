-- INSERT INTO - команда для вставки записів у таблицю
-- вставка 1 запису
INSERT INTO users VALUES 
('John', 'Doe', 'jd@gmail.com', 9999.99, true, '2001-04-15');
-- вставка декількох записів
INSERT INTO users VALUES
('Jane', 'Smith', 'js@gmail.com', 1234.99, false, '1999-05-13'),
('Test', 'Test', 'test@gmail.com', 8.99, true, '1998-11-09'),
('Admin', 'Moder', 'am@gmail.com', -3456.54, true, '1035-12-23');
-- вставка даних у довільному порядку і у вказані стовпчики
-- @block
INSERT INTO users
(account_balance, first_name, last_name, email, is_male)
VALUES
(5000, 'Jane', 'Tcepes', 'vt@gmail.com', true);
-- (5000, NULL, NULL, NULL, NULL, NULL);
-- @block
INSERT INTO users
(first_name, last_name, email, account_balance, is_male, birthday, height)
VALUES
('Jane', 'Smith', '', 1234.99, false, '1999-05-13', 1.5),
('Test', 'Test', 'test1@gmail.com', 8.99, true, '1998-11-09', -5),
('Admin', 'Moder', 'am1@gmail.com', 3456.54, true, '1035-12-23', 9.99);