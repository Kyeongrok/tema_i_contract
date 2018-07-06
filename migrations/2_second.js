var ReservationContract = artifacts.require("./ReservationContract.sol");
var ReserveToken = artifacts.require("./ReserveToken.sol");


module.exports = function(deployer) {
    deployer.deploy(ReserveToken);
    deployer.deploy(ReservationContract);
};