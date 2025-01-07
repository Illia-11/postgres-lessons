const _ = require('lodash');

module.exports.mapUser = (user) => {

  const { name: {first, last}, email, gender, dob: {date: birthday}} = user;

  const height = _.random(1.3, 2);

  const accountBalance = _.random(0, 25000);

  return `('${first}', '${last}',' ${email}', ${gender === 'male'}, ${height}, ${accountBalance}, '${birthday}')`;
}