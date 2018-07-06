const Room = artifacts.require("./Room.sol");

contract('Room', (accounts) => {
    it("getHost", () => {
        return Room.deployed().then(instance => {
            // instance.getHost().then(host => console.log('host:', host));
        });
    });

    it("regist and get Room Test", () => {
        return Room.deployed().then(instance => {
            instance.registRoom("room-1", 100);
            instance.roomCount().then(count => console.log("roomCount:",count));
            instance.myAccount().then(addr => {
                instance.rooms(addr).then(room=>{
                    assert.equal('room-1', room[1]);
                });
            });


        });
    });
});
