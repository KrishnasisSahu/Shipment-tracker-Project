const Buyer_contract = artifacts.require("Buyer");

module.exports = async function (deployer,accounts) {
  await deployer.deploy(Buyer_contract);
};











