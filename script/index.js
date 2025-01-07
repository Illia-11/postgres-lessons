const { Client } = require('pg');
const _ = require('lodash');
const { getUsers } = require('../api');

const config = {
  user: 'postgres',
  password: 'postgres',
  host: 'localhost',
  port: 5432,
  database: 'lessons',
};

const client = new Client(config);


function mapUser(user) {

  const { name: {first, last}, email, gender, dob: {date: birthday}} = user;

  const height = _.random(1.3, 2);

  const accountBalance = _.random(0, 25000);

  return `('${first}', '${last}',' ${email}', ${gender === 'male'}, ${height}, ${accountBalance}, '${birthday}')`;
}

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