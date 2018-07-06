const Room = artifacts.require("./Room.sol");

contract('Room', (accounts) => {
    it("getHost", () => {
        return Room.deployed().then(instance => {
            // instance.getHost().then(host => console.log('host:', host));
        });
    });

    it("regist and get Room Test", () => {
        return Room.deployed().then(instance => {
            instance.registRoom("room3", 200);
            return instance.myAccount().then(addr => {
                return instance.roomByIndex(0).then(room=>{
                    console.log("room0:", room);
                })


                instance.rooms(addr).then(room=>{
                    console.log(addr);
                     assert.equal('room3', room[1]);
                });
            });


        });
    });
});
