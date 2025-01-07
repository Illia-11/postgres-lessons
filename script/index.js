const { Client } = require('pg');
const { getUsers } = require('../api');
const { mapUser } = require("../utils/userUtils")

const config = {
  user: 'postgres',
  password: 'postgres',
  host: 'localhost',
  port: 5432,
  database: 'lessons',
};

const client = new Client(config);

async function startScript() {
  await client.connect();

  const users = await getUsers();

  const usersInsertStringsArray = users.map(mapUser);

  const usersInsertString = usersInsertStringsArray.join(',');

  const res = await client.query(`
    INSERT INTO users (
      first_name,
      last_name,
      email,
      is_male,
      height,
      account_balance,
      birthday
    ) VALUES
    ${usersInsertString}
    RETURNING *;
  `);

  // console.log(res); // res.rows - резульатати запиту (користувачі)

  console.log(res.rows);

  await client.end();
}

startScript();