const { Client } = require('pg');
const config = require('../configs/db.json');
const { getUsers } = require('../api');
const { mapUser } = require('../utils/userUtils');

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

  await client.end();
}

startScript();