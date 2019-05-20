const Data_sharing = artifacts.require("Data_sharing");

module.exports = function(deployer, network, accounts) {
  deployer.deploy(Data_sharing);
};