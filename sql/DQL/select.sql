-- команда для отримання даних з БД
/*
  SELECT список_виборки FROM табличний_вираз

  список_виборки - список стовпчиків дані з яких треба повернути у результаті
                    може складатися як з існуючих стовпчиків так і з якихось
                    стовпчиків які будуть розраховані чисто для цього запиту

  табличний_вираз - таблиця або більш складна конструкція з декількох таблиць

  SELECT сам по собі повертає, як результат, табличний вираз
*/
-- 
SELECT random();
-- повернути всі записи з конкретної таблиці
SELECT * FROM users;
-- повернути дані зі стовпчиків id, email, is_male, birthday
SELECT id, email, is_male, birthday FROM users;
-- повернути стовпчик id та новий стовпчик у якому буде імʼя прізвище користувача
SELECT id, first_name || ' ' || last_name full_name FROM users;
-- повернути дані зі стовпчика account_balance але при цьому перейменувати його
SELECT id, email, account_balance AS "accountBalance" FROM users;
-- або
SELECT id айдішнік, email пошта, account_balance "accountBalance" FROM users;
-- WHERE
-- усі користувачі з висотою 1.75
SELECT * FROM users
WHERE height = 1.75;
-- всі користувачі які не вказали дату народження
SELECT * FROM users
WHERE birthday IS NULL;
-- знайти всіх жінок
SELECT * FROM users
WHERE NOT is_male;
-- всі користувачі з балансом від 500 до 5000
SELECT * FROM users
WHERE account_balance >= 500 AND account_balance <= 5000;
-- всі користувачі з балансом від 500 до 5000
SELECT * FROM users
WHERE account_balance BETWEEN 500 AND 5000;
-- Сортування результатів
/*
  ORDER BY стовпчик_по_якому_сортувати напрям_сортування

  напрями:
    ASC - по зростанню (за замовчанням)
    DESC - по спаданню
*/
-- сортування по айдішніку по зростанню
SELECT * FROM users
ORDER BY id ASC;
-- сортування по балансу аккаунту по спаданню і по висоті по зростанню
SELECT * FROM users
ORDER BY account_balance DESC, height ASC;
-- 
SELECT * FROM users
ORDER BY email ASC;
-- 
SELECT * FROM users
ORDER BY birthday ASC;
-- пагінація
/*
  LIMIT число - вказує скільки результатів має повернути селект (results)
  OFFSET число - вказує скільки результатів треба пропестити (+- page)
*/
-- повернути одного користувача
SELECT * FROM users
ORDER BY id ASC
-- після сортування якщо воно є
LIMIT 1
OFFSET 2;
/*
  Агрегатні функції - функції, які з багатьох значень 

      avg - середнє значення
      min - мінімальне значення
      max - максимальне значення
      sum - сума вхідних значень / виразів. (аналог reduce у js)
      count - рахує кількість кортежів або рядку у запиті
*/
-- мінімальний зріст користувача
SELECT min(height) FROM users;
-- середній зріст користувачів
SELECT avg(height) FROM users;
-- максимальний зріст користувача
SELECT max(height) FROM users;
-- загальна кількість грошей на всіз акаунтах
SELECT sum(account_balance) "всього грошей" FROM users;
-- скільки користувачів мають певне імʼя
SELECT count(*) FROM users
WHERE first_name = 'Kuzman';
-- кількість чоловіків
SELECT count(*) FROM users
WHERE is_male = false;
-- середній зріст чоловіків
SELECT avg(height) FROM users
WHERE is_male = TRUE;
-- середній зріст чоловіків
SELECT avg(height) FROM users
WHERE is_male = FALSE;
-- середній зріст і чоловіків і жінок у одному запиті
SELECT avg(height), min(height), is_male FROM users
GROUP BY is_male;
-- групування
-- всі унікальні значення висоти
SELECT height FROM users
GROUP BY height;
--
/*
  ДЗ:
    Знайти:
    1. Мінімальний баланс чоловіків

    2. Мінімальний, максимальний і середній баланс жінок

    3. Кількість людей які народилися у певну дату

    4. Кількість чоловіків і жінок баланс яких більше за 3000
*/
SELECT min(account_balance) FROM users
WHERE is_male;

SELECT min(account_balance), max(account_balance), avg(account_balance) FROM users
WHERE NOT is_male;

SELECT count(*) FROM users
WHERE birthday = '1947-03-26';

SELECT count(*), is_male FROM users
WHERE account_balance > 3000
GROUP BY is_male;
--