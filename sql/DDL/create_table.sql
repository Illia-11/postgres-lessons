-- CREATE TABLE - створює таблиці у БД
CREATE TABLE my_table(); -- пуста таблиця
-- таблиця зі стовпчиками
-- @block
CREATE TABLE users(
  -- стовпчики пишуться у форматі імʼя тип_даних
  -- id SERIAL, -- автоінкрементований цілочислений тип даних
  -- UUID який буде генеруватися за замовчанням якщо його не вказати
  -- id UUID DEFAULT gen_random_uuid(),
  -- PRIMARY KEY - комбінація обмежень UNIQUE NOT NULL
  -- 
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(64) NOT NULL,
  last_name VARCHAR(64) NOT NULL,
  -- UNIQUE - обмеження стовпчика яке гарантує унікальність значень у ньому.
  -- Є ключем для таблиці
  email VARCHAR(256) NOT NULL UNIQUE,
  account_balance NUMERIC(11,2) DEFAULT 0.00, -- число
  is_male BOOLEAN, -- булеве значення
  birthday DATE, -- дата
  -- UNIQUE як обмеження таблиці
  -- робимо значення стовпчика birthday унікальними по іншому
  -- UNIQUE (birthday)
  -- у таблиці можуть бути тільки унікаьлні комбінації імен і прізвищ
  UNIQUE (first_name, last_name)
);

-- @block
CREATE TABLE cars_to_dealerships (
  car_id INT,
  dealership_id INT,
  PRIMARY KEY (car_id, dealership_id)
);

-- @block
CREATE TABLE IF NOT EXISTS users();

/*
  Символьні типи даних
    text - найближчий аналог JS стрінги
    char(X) - рядок фіксованої довжини
    varchar(X) - рядок фіксованої змінної довжини

    char(4)
    '1234'
    '1234'5
    '12  '

    varchar(4)
    '1234'
    '1234'5
    '12'


  Цифрові типи даних
  INTEGER === INT - цілі числа

  NUMERIC === DECIMAL - довільні числа

  NUMERIC(t, m)
  NUMERIC(t)

  t - точність - загальна кількість цифр у числі
  m - масштаб - кількість цифр після крапки (дробова частина)

  NUMERIC(6)
  123456
  999999

  NUMERIC(6, 2)
  1234.56
  1234
  1234.567
*/

--
/*
  Міні ДЗ:
    Створити наступну таблицю Книжки у вашій БД з наступними стовпчиками:
      назва
      автор
      кількість сторінок
      чи є на складі
      синопсис
      ціна
*/
CREATE TABLE IF NOT EXISTS books(
  title VARCHAR(300),
  author VARCHAR(128),
  pages SMALLINT,
  is_exists BOOLEAN,
  synopsis TEXT,
  price NUMERIC(9,2)
);
--