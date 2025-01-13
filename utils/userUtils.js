const _ = require('lodash');
const userGenConfig = require('../configs/usersGeneration.json');

const mapUser = (user) => {

  const { name: {first, last}, email, gender, dob: {date: birthday}} = user;

  const isMale = gender === 'male';

  const height = _.random(userGenConfig.minHeight, userGenConfig.maxHeight);
  const accountBalance = _.random(userGenConfig.minAccountBalance, userGenConfig.maxAccountBalance);
  const weight = _.random(userGenConfig.minWeight, userGenConfig.maxWeight);
  const comments = _.random(userGenConfig.minComments, userGenConfig.maxComments);

  return `('${first}', '${last}', '${email}', ${isMale}, ${accountBalance}, ${height}, ${weight}, ${comments}, '${birthday}')`;
}

const mapUsers = (usersArr) => usersArr.map((user) => mapUser(user)).join(',');

module.exports.mapUser = mapUser;
module.exports.mapUsers = mapUsers;