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