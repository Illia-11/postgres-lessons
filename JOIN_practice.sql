-- @block Дані про товари (назва, ціна, кількість замовленго товару, категорія, виробник) у конкретному замовленні

SELECT p.name, p.price, pto.quantity, p.category, p.manufacturer FROM products p
  JOIN products_to_orders pto ON pto.product_id = p.id
WHERE pto.order_id = 5;

-- @block Кількість одиниць куплених товарів певної категорії у конкретному замовлені (3 пляшки коли + 2 пачки чіпсів = 5 товарів)

SELECT sum(pto.quantity) FROM products p
  JOIN products_to_orders pto ON pto.product_id = p.id
  JOIN orders o ON pto.order_id = o.id
WHERE p.category = 'electronics' AND order_id = 1;

-- @block Кількість коментарів певного користувача з рейтингом більше 3

SELECT u.id, count(u.comments) FROM users u
  JOIN reviews re ON re.user_id = u.id
  JOIN ratings ra ON ra.review_id = re.id
WHERE ra.rating > 3 AND u.id = 46
GROUP BY u.id;

-- @block Кожне замовлення певного користувача зі статусом 'finished' та його загальна ціна

SELECT order_id, sum(p.price * pto.quantity) total_price FROM users u
  JOIN orders o ON o.user_id = u.id
  JOIN products_to_orders pto ON o.id = order_id
  JOIN products p ON p.id = product_id
WHERE o.status = 'finished' AND u.id = 16
GROUP BY order_id;