/**
* @type import('hardhat/config').HardhatUserConfig
*/

require('dotenv').config();
require("@nomiclabs/hardhat-ethers");
require("./scripts/deploy.js");
require("./scripts/mint.js");
<<<<<<< HEAD
require("@nomiclabs/hardhat-etherscan");

const { ALCHEMY_KEY, ACCOUNT_PRIVATE_KEY, POLYGONSCAN_API_KEY } = process.env;
=======

const { ALCHEMY_KEY, ACCOUNT_PRIVATE_KEY } = process.env;
>>>>>>> 2818b682c3fcbf89c35d9c572bcdcd6ecfe2d8f5

module.exports = {
   solidity: "0.8.1",
   defaultNetwork: "maticmum",
   networks: {
    hardhat: {},
    maticmum: {
      url: `https://polygon-mumbai.g.alchemy.com/v2/${ALCHEMY_KEY}`,
      accounts: [`0x${ACCOUNT_PRIVATE_KEY}`]
    },
    matic: {
      chainId: 80001,
      url: `https://polygon-mumbai.g.alchemy.com/v2/${ALCHEMY_KEY}`,
      accounts: [`0x${ACCOUNT_PRIVATE_KEY}`]
    },
  },
<<<<<<< HEAD
  etherscan: {
    apiKey: POLYGONSCAN_API_KEY,
  },
=======
>>>>>>> 2818b682c3fcbf89c35d9c572bcdcd6ecfe2d8f5
}