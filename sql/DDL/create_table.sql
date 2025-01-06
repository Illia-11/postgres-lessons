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
  first_name VARCHAR(64) NOT NULL CHECK (first_name != ''),
  last_name VARCHAR(64) NOT NULL,
  -- UNIQUE - обмеження стовпчика яке гарантує унікальність значень у ньому.
  -- Є ключем для таблиці
  -- CONSTRAINT "назва_обмеження" перед обмеженням типу CHECK, UNIQUE, PRIMARY KEY
  -- дозволяє змінити назву обмеження на вказану в ідентифікаторі
  email VARCHAR(256) NOT NULL 
  CONSTRAINT "email must be unique" UNIQUE 
  CONSTRAINT "not empty email" CHECK (email != ''),
  account_balance NUMERIC(11,2) DEFAULT 0.00 CHECK (account_balance >= 0), -- число
  height NUMERIC(3,2) NOT NULL CHECK(height >= 0.5 AND height <= 3),
  is_male BOOLEAN, -- булеве значення
  birthday DATE CHECK (birthday > '1890-01-01' AND birthday <= current_date), -- дата
  updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  -- UNIQUE як обмеження таблиці
  -- робимо значення стовпчика birthday унікальними по іншому
  -- UNIQUE (birthday)
  -- у таблиці можуть бути тільки унікаьлні комбінації імен і прізвищ
  CONSTRAINT "only unique combination of first and last name allowed" UNIQUE (first_name, last_name),
  CHECK (last_name != '')
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