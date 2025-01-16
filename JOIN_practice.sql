-- @block Дані про товари (назва, ціна, кількість замовленго товару, категорія, виробник) у конкретному замовленні

SELECT p.name, p.price, pto.quantity, p.category, p.manufacturer FROM products p
  JOIN products_to_orders pto ON pto.product_id = p.id
  JOIN orders o ON pto.order_id = o.id
WHERE o.id = 5;

-- @block Кількість одиниць куплених товарів певної категорії у конкретному замовлені (3 пляшки коли + 2 пачки чіпсів = 5 товарів)

SELECT count(p.quantity) FROM products p
  JOIN products_to_orders pto ON pto.product_id = p.id
  JOIN orders o ON pto.order_id = o.id
WHERE p.category = 'electronics';

-- @block Кількість коментарів певного користувача з рейтингом більше 3

SELECT u.id, count(u.comments) FROM users u
  JOIN reviews re ON re.user_id = u.id
  JOIN ratings ra ON ra.review_id = re.id
WHERE ra.rating > 3
GROUP BY u.id;

-- @block Кожне замовлення певного користувача зі статусом 'finished' та його загальна ціна

SELECT sum(p.price), p.id FROM products p
  JOIN products_to_orders pto ON pto.product_id = p.id
  JOIN orders o ON pto.order_id = o.id
  JOIN users u ON o.user_id = u.id
WHERE o.status = 'finished' AND u.id = 16
GROUP BY p.id;