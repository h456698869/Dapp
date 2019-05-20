var HDWalletProvider = require("truffle-hdwallet-provider");

var infura_apikey = "ea9d1f6d92dd44a287818931edf26252";
var mnemonic = "giant system abstract silly bullet absorb maze month together intact antique raise";
var address = "0x0101478401aB63125985d3D6b19e8dAA543a040E"

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  solc: {
    optimizer: {
      enabled: true,
      runs: 200
    }
  },
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    },
    ropsten: {
      provider: function() {
        return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/"+infura_apikey)
      },
      network_id: 3,
      from: address,
      gas: 4700388
    }
  }
};

/*  module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    }
    
  }
};*/
