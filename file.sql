-- тут будемо писати SQL команди
/*
  багаторядковий коментар
*/
/*
  SQL - Structure Query Language (структурована мова запитів)
    мова яка використовується для взаємодії з реляційними СУБД
*/

/*
  Синтаксис SQL команди:
    Команда складається з купи компонентів, після яких ставиться крапка з комою

    Приклад:
    CREATE TABLE users();

    CREATE, TABLE - ключові слова

    users - ідентифікатор

    "users" - ідентифікатор в лапках (зберігає регістр)
*/

CREATE TABLE users();

cReATE tabLE USERS();

-- найменування у SQL

CREATE TABLE userOrders();

CREATE TABLE "userOrders"();

CREATE TABLE user_orders(); -- snake_case

-- константи
/*
  - рядки
  - бітові рядки
  - числа
*/
'test' -- рядкова константа
"text" -- ідентифікатор
'ім''я' -- екранування апострофа у SQL
$$ім'я$$ -- рядкова константа для Postgresql '

-- числа
10
0.5
5e+2

DATE '2025-01-01';
'2025-01-01'::DATE; -- Postgresql
CAST ('2025-01-01' AS DATE);

CREATE TABLE cars();