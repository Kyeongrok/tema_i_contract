const ReserveToken = artifacts.require("./ReserveToken.sol");

contract('ReserveToken', (accounts) => {
    it("first case", () => {
        ReserveToken.deployed().then((instance) => {

            console.log(accounts[0]);

            instance.registRoom("hello", 100);
            instance.echoAddress(accounts[0]).then((item)=>{
                console.log(item);
            });

        });

    });
});
