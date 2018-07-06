var Reservation = artifacts.require("./Reservation.sol");
var Room = artifacts.require("./Room.sol");


module.exports = function(deployer) {
    deployer.deploy(Room);
    deployer.deploy(Reservation);
};