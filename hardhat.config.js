require("@nomiclabs/hardhat-waffle");
require('@openzeppelin/hardhat-upgrades');
require("@nomiclabs/hardhat-etherscan");

const API_URL ="https://rinkeby.infura.io/v3/b31f3f4d50b74163971f9d73880a19b1";
const RINKEBY_KEY = "54cabe66df5f23899d61ea63f7cb80ef0f340f2b0c744c803bae81ee394209c4";

module.exports = {
  solidity: "0.8.2",
  networks :{
    rinkeby : {
      url : API_URL,
      accounts : [`${RINKEBY_KEY}`]
    }
  },
  etherscan: {
    apiKey:  "PZFUENQQZY2INKNZ2YXNWB5GZKX8W264KU"
  }
};