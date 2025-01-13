const fs = require('fs').promises;
const { Client } = require('pg');
const _ = require('lodash');
const config = require('../configs/db.json');
const { chanceToMakeOrder } = require('../configs/ordersGeneration.json');
const { getUsers } = require('../api');
const { mapUsers } = require('../utils/userUtils');
const { generateProducts } = require('../utils/productUtils');
const { generateOrders, generateProductsToOrders } = require('../utils/orderUtils');
const { generateReviews, generateRatings, generateReviewsMap } = require('../utils/reviewUtils');

const client = new Client(config);

async function startScript() {
  await client.connect();

  const resetQuery = await fs.readFile(`${__dirname}/sql/resetDB.sql`, 'utf-8');

  await client.query(resetQuery);
  
  const users = await getUsers();

  await client.query('DELETE FROM users;');

  const { rows: createdUsers } = await client.query(`
    INSERT INTO users (
      first_name,
      last_name,
      email,
      is_male,
      account_balance,
      height,
      weight,
      comments,
      birthday
    ) VALUES
    ${mapUsers(users)}
    RETURNING *;
  `);

  const { rows: createdProducts } = await client.query(`
    INSERT INTO products (
      "name", 
      "category", 
      "description",
      "manufacturer",
      "price",
      "quantity"
    )
    VALUES
    ${generateProducts()}
    RETURNING *
  ;`);

  const orderingUsers = createdUsers.filter(
    () => _.random(0, 100) <= chanceToMakeOrder
  );

  const { rows: createdOrders } = await client.query(`
    INSERT INTO orders (
      "user_id",
      "status"
    )
    VALUES
    ${generateOrders(orderingUsers)}
    RETURNING *
    ;`);

  const { rows: productsToOrdersResult } = await client.query(`
    INSERT INTO products_to_orders (
      product_id,
      order_id,
      quantity
    ) VALUES
    ${generateProductsToOrders({
      orders: createdOrders,
      products: createdProducts,
    })}
    RETURNING *
    ;
  `);

  const reviewsMap = generateReviewsMap(createdOrders, productsToOrdersResult);

  await client.query(`
    BEGIN;
    
    INSERT INTO reviews
    (user_id, product_id, rating_id, body)
    VALUES ${generateReviews(reviewsMap)};
    
    INSERT INTO ratings
    (review_id, rating)
    VALUES ${generateRatings(reviewsMap)};
    
    COMMIT;`);


  await client.end();
}

startScript();