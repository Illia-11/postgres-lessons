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