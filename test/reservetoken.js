const ReserveToken = artifacts.require("./ReserveToken.sol");
const ReservationContract = artifacts.require("./ReservationContract.sol");


contract('ReserveToken', (accounts) => {
    it("echo address", () => {
        return ReserveToken.deployed().then(instance => {
            instance.echoAccount(accounts[0]).then((item)=>{
                assert.equal(accounts[0], item);
             });
        });
    });

    it("reserve", () => {
        return ReserveToken.deployed().then(instance => {
            // getRoom()
            return ReserveToken.deployed().then(instance => {
                instance.registRoom("room-1", 100);
                instance.roomCount().then(count => console.log("roomCount:",count));
                instance.myAccount().then(addr => {
                    return ReservationContract.deployed().then(rc =>{
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
