-- оновлення записів у таблиці
-- змінити всім користувачам прізвище на Baker
UPDATE users
SET last_name = 'Baker';
-- змінити конкретному користувачу імʼя на Adam
UPDATE users
SET first_name = 'Adam'
WHERE email = 'test1@gmail.com';
-- зміна декількох стовпчиків одразу
-- змінити імʼя прізвищу та поле updated_at користувача
UPDATE users
SET first_name = 'Eduardo', last_name = 'Santiago', updated_at = current_timestamp
WHERE id = 12;
-- встановити баланс у 1500 11 та 14 користувачу
UPDATE users
SET account_balance = 1500, updated_at = current_timestamp
WHERE id = 11 OR id = 14;
--
UPDATE users
SET account_balance = 2500, updated_at = current_timestamp
WHERE id IN (11, 14);
-- 
UPDATE users
SET is_male = FALSE
WHERE id % 2 = 0;
-- оновлення даних на основі старих даних
-- збільшити висоту 13 юзера на 5 сантиметрів
UPDATE users
SET height = height + 0.05
WHERE id = 13;