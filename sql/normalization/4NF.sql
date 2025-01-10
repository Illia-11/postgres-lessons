-- 4 Нормальна форма
/*
  є 3 сутності:
    ресторани
    їжа
    райони міста

  ресторани готують певні страви
  служба доставки може доставляти їжу з ресторанів у певні райони міста
*/
-- @block НЕ у 4 НФ
CREATE TABLE restaurants (
  id SERIAL PRIMARY KEY,
  "name" TEXT,
  "address" TEXT
);
--
CREATE TABLE food_types (
  id SERIAL PRIMARY KEY,
  "name" TEXT,
  price NUMERIC
);
--
CREATE TABLE delivery (
  restaurant_id INT REFERENCES restaurants,
  food_id INT REFERENCES food_types,
  delivery_location TEXT,
  PRIMARY KEY (restaurant_id, food_id, delivery_location)
);
--
INSERT INTO delivery
VALUES
(1, 1, 'District 1'),
(1, 1, 'District 2'),
(1, 1, 'District 3'),
(1, 1, 'District 4'),
(1, 2, 'District 1'),
(1, 2, 'District 2'),
(1, 2, 'District 3'),
(1, 2, 'District 4'),
(2, 1, 'District 1'),
(2, 1, 'District 2'),
(2, 1, 'District 4');
-- @block у 4 НФ
CREATE TABLE restaurants (
  id SERIAL PRIMARY KEY,
  "name" TEXT,
  "address" TEXT
);
--
CREATE TABLE food_types (
  id SERIAL PRIMARY KEY,
  "name" TEXT,
  price NUMERIC
);
--
CREATE TABLE delivery_locations (
  id SERIAL PRIMARY KEY,
  delivery_location TEXT
);
--
CREATE TABLE restaurants_to_foods (
  restaurant_id INT REFERENCES restaurants,
  food_id INT REFERENCES food_types,
  PRIMARY KEY (restaurant_id, food_id)
);
--
CREATE TABLE restaurants_to_locations (
  restaurant_id INT REFERENCES restaurants,
  location_id INT REFERENCES delivery_locations,
  PRIMARY KEY (restaurant_id, location_id)
);
--
INSERT INTO restaurants_to_foods
VALUES
(1, 1),
(1, 2),
(2, 1);
--
INSERT INTO restaurants_to_locations
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 4);
--
INSERT INTO restaurants
("name", "address")
VALUES
('Пузата Хата', 'addr1'),
('tratoria', 'addr2');
--
INSERT INTO food_types
("name", price)
VALUES
('Борщ', 70),
('Макарони', 50);
--
INSERT INTO delivery_locations
(delivery_location)
VALUES
('District 1'),
('District 2'),
('District 3'),
('District 4');