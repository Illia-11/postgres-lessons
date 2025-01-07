const axios = require("axios");

const httpClient = axios.create({
  baseURL: "https://randomuser.me/api/",
});

module.exports.getUsers = async () => {
  const result = await httpClient.get("?seed=12345&page=1&results=50");

  const { data: { results: users } } = result;

  return users;
}