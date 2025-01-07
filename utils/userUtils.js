const _ = require('lodash');
const userGenConfig = require('../configs/usersGeneration.json');

module.exports.mapUser = (user) => {

  const { name: {first, last}, email, gender, dob: {date: birthday}} = user;

  const height = _.random(userGenConfig.minHeight, userGenConfig.maxHeight);

  const accountBalance = _.random(userGenConfig.minAccountBalance, userGenConfig.maxAccountBalance);

  return `('${first}', '${last}',' ${email}', ${gender === 'male'}, ${height}, ${accountBalance}, '${birthday}')`;
}