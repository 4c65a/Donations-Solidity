//require("dotenv").config({ path: ".env" });
//const ALCHEMY_API_KEY_URL = process.env.ALCHEMY_API_KEY_URL;
//const GOERLI_PRIVATE_KEY = process.env.GOERLI_PRIVATE_KEY;

require("@nomicfoundation/hardhat-toolbox");


const ALCHEMY_API_KEY = "";

const GOERLI_PRIVATE_KEY = "";

module.exports = {
  solidity: "0.8.17",
  networks: {
    goerli: {
      url: `https://eth-goerli.alchemyapi.io/v2/${ALCHEMY_API_KEY}`,
      accounts: [GOERLI_PRIVATE_KEY]
    }
  }
};