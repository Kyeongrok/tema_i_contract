var ReserveToken = artifacts.require("./ReserveToken.sol");

module.exports = function(deployer) {
    deployer.deploy(ReserveToken);
};

