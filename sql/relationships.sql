/*
  Види звʼязків сутностей у БД:

    1 : 1 - один до одного
      (у 1 країни є 1 прапор, у 1 прапора 1 країна)
      (1 користувачі відповідає 1 запис даних користувача, 1 запис користувача належить 1 користувачу)

    1 : m - один до багатьох
      (в одній групі багато студентів, у 1 студента буде 1 група)
      (у книжки 1 автор, у автора багато книжок)

    n : m - багато до багатьох
      (в одному чаті багато людей, конкретний користувач теж має багато чатів)
      (в одному замовленні може бути багато товарів, товар може знаходитися в багатьох замовленнях)

    По жорсткості звʼязку (по обовʼязковості):
      Жорсткі - запис обовʼязково повʼязаний з записом у іншій таблиці (1)
      Нежорсткі - запис НЕобовʼязково повʼязаний з записом у іншій таблиці (0)

    По кількості таблиці у звʼязку%
      Унарні звʼязки (запис з таблиці посилається на інший запис з цієї ж таблиці)
      Бінарний звʼязок (дві таблиці у звʼязку)
      Тернарний звʼязок
      ...
*/