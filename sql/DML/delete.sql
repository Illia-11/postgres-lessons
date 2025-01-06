-- видалення записів з таблиць
-- видалити всі записи з таблиці
DELETE FROM users;
-- видалення конкретного користувача по його ключу
-- по id
DELETE FROM users
WHERE id = 9;
-- видалення всіх користувачів які народилися до 5 грудня 2001
DELETE FROM users
WHERE birthday < '2001-12-05'
-- повернути значення з конкретних стовчиків
RETURNING id, first_name, last_name, email;