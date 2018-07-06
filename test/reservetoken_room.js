const ReserveToken = artifacts.require("./ReserveToken.sol");

contract('ReserveToken', (accounts) => {
    it("getHost", () => {
        return ReserveToken.deployed().then(instance => {
            // instance.getHost().then(host => console.log('host:', host));
        });
    });

    it("regist and get Room Test", () => {
        return ReserveToken.deployed().then(instance => {
            instance.registRoom("room-1", 100);
            instance.roomCount().then(count => console.log("roomCount:",count));
            instance.myAccount().then(addr => {
                instance.getRoomName(addr).then(name => {
                    assert.equal("room-1", name)
                });
                instance.getRoomPrice(addr).then(price => {
                    assert.equal(100, price);
                });
            });


        });
    });
});
