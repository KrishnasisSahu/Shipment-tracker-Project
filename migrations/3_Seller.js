const Seller_contract = artifacts.require("Seller");

module.exports = async function (deployer) {
  await deployer.deploy(Seller_contract);
};
