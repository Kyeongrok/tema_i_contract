const ReserveToken = artifacts.require("./ReserveToken.sol");

contract('ReserveToken', (accounts) => {
    it("echo address", () => {
        return ReserveToken.deployed().then(instance => {
            instance.echoAccount(accounts[0]).then((item)=>{
                console.log(item);
                assert.equal(accounts[0], item);
            });
        });
    });

    it("reserve and count", () => {
        return ReserveToken.deployed().then((instance) => {
            instance.reserve(accounts[0], "7-1", "7-2")
                .then(result => {
                    return instance.roomCount();
                })
                .then(count => {
                    console.log(`count: ${count}`)
                    assert.equal(0, count);
                });
        });
    });


});
