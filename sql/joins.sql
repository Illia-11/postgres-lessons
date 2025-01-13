-- @block
CREATE TABLE IF NOT EXISTS a (
  field_1 VARCHAR(3),
  field_2 NUMERIC(5,2)
);
--
CREATE TABLE IF NOT EXISTS b (
  field_1 VARCHAR(3),
  field_3 TEXT
);
-- @block inserts
INSERT INTO a
(field_1, field_2)
VALUES
('AAA', 500),
('ABB', 500),
('ABC', 500),
('BBB', 500),
('BCA', 500),
('BCB', 500),
('CAA', 500),
('CCC', 500);
--
INSERT INTO b
(field_1, field_3)
VALUES
('AAA', 'some text 1'),
('ACB', 'some text 1'),
('BAA', 'some text 1'),
('CAA', 'some text 1');
-- Поєднання запитів
-- у всіх запитах мають бути однакова кількість стовпчиків з однаковими типами даних
-- @block UNION - всі унікальні результати двох запитів
SELECT field_1 FROM a
UNION
SELECT field_1 FROM b;
-- @block INTERSECT - всі спільні результати двох запитів
SELECT field_1 FROM a
INTERSECT
SELECT field_1 FROM b;
-- @block EXCEPT - віднімання з результатів першого запиту значень які є у другому
SELECT field_1 FROM a
EXCEPT
SELECT field_1 FROM b;
--
SELECT field_1 FROM b
EXCEPT
SELECT field_1 FROM a;
--
SELECT field_1 FROM a
UNION
SELECT field_1 FROM b
INTERSECT
SELECT field_1 FROM c;
-- всі користувачі у яких є замовлення
SELECT user_id FROM orders
INTERSECT
SELECT id FROM users;
-- всі користувачі у яких НЕМАЄ замовлення
SELECT id FROM users
EXCEPT
SELECT user_id FROM oders
ORDER BY id ASC;
-- @block
-- Декартовий добуток - всі рядки з таблиці а множаться на всі рядки з таблиці b (багато зайвого сміття)
SELECT * FROM a, b;
-- @block
-- Декартовий добуток, результати якого відфільтровано по якомусь спільному значенню яке є у обох таблицях
SELECT * FROM a, b
WHERE a.field_1 = b.field_1;
--
SELECT * FROM a
  JOIN b ON a.field_1 = b.field_1;