const axios = require('axios');
const { baseURL, results, seed } = require('../configs/api.json');

const httpClient = axios.create({
  baseURL
});

module.exports.getUsers = async () => {
  const result = await httpClient.get(`?seed=${seed}&results=${results}`);

  const {
    data: { results: users },
  } = result;

  return users;
};