const { Client } = require("pg");

const config = {
  user: "postgres",
  password: "postgres",
  host: "localhost",
  port: 5432,
  database: "lessons",
};

const client = new Client(config);

const user = {
  firstName: "Insert",
  lastName: "Insertovich",
  email: "inserter@gmail.com",
  accountBalance: 250,
  height: 1.67,
  isMale: true,
  birthday: "1980-07-15",
};

const users = [
  {
    firstName: "Insert 1",
    lastName: "Insertovich 1",
    email: "inserter1@gmail.com",
    accountBalance: 250,
    height: 1.67,
    isMale: true,
    birthday: "1980-07-15",
  },
  {
    firstName: "Insert 2",
    lastName: "Insertovich 2",
    email: "inserter2@gmail.com",
    accountBalance: 250,
    height: 1.67,
    isMale: false,
    birthday: "1995-02-12",
  },
  {
    firstName: "Insert 3",
    lastName: "Insertovich 3",
    email: "inserter3@gmail.com",
    accountBalance: 250,
    height: 1.67,
    isMale: true,
    birthday: "1976-07-15",
  },
];

function mapUser() {
  return `('${user.firstName}', '${user.lastName}', '${user.email}', ${user.isMale}, ${user.height}, ${user.accountBalance}, '${user.birthday}')`;
}

const usersInsertStringsArray = users.map(mapUser);

// console.log(usersInsertStrings);

const usersInsertStrings = usersInsertStringsArray.join(",");

// console.log(usersInsertStrings);

async function startScript() {
  await client.connect();

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
    ${usersInsertStrings}
    RETURNING *; 
  `);

  // console.log(res); // res.rows - результати запиту (користувачі)

  console.log(res.rows[0]);

  await client.end();
}

startScript();
