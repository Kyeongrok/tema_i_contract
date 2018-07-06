const Room = artifacts.require("./Room.sol");

contract('Room', (accounts) => {
    it("getHost", () => {
        return Room.deployed().then(instance => {
            // instance.getHost().then(host => console.log('host:', host));
        });
    });

    it("regist and get Room Test", () => {
        return Room.deployed().then(instance => {
            instance.registRoom("room2", 100);
            instance.myAccount().then(addr => {
                instance.rooms(addr).then(room=>{
                    // assert.equal('room2', room[1]);
                });
            });


        });
    });
});
