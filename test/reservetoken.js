const Room = artifacts.require("./Room.sol");
const Reservation = artifacts.require("./Reservation.sol");


contract('Room', (accounts) => {
    it("echo address", () => {
        return Room.deployed().then(instance => {
            instance.echoAccount(accounts[0]).then((item)=>{
                assert.equal(accounts[0], item);
             });
        });
    });

    it("reserve", () => {
        return Room.deployed().then(instance => {
            // getRoom()
            return Room.deployed().then(instance => {
                instance.registRoom("room-1", 100);
                instance.roomCount().then(count => console.log("roomCount:",count));
                instance.myAccount().then(addr => {
                    return Reservation.deployed().then(rc =>{
                        rc.reserve(addr, "7-5", 1);
                        rc.reserves(addr).then(item=>{
                            assert.equal('7-5', item[1]);
                        })
                    });
                });
        });

    });
    });



});
