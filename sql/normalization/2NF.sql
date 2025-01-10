-- 2 Нормальна форма
-- @block таблиця НЕ у 2 НФ
CREATE TABLE teachers (
  id SERIAL,
  course TEXT,
  birthday DATE,
  PRIMARY KEY (id, course)
);
-- @block таблиця у 2 НФ
CREATE TABLE teachers (
  id SERIAL PRIMARY KEY,
  birthday DATE
);
--
CREATE TABLE teachers_to_courses (
  teacher_id INT REFERENCES teachers,
  course TEXT,
  PRIMARY KEY (id, course)
);