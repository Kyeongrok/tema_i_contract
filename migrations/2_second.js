var Reservation = artifacts.require("./Reservation.sol");
var Room = artifacts.require("./Room.sol");
var TemaToken = artifacts.require("./TemaToken.sol");


module.exports = function(deployer) {
    deployer.deploy(TemaToken);
    deployer.deploy(Room);
    deployer.deploy(Reservation);
};