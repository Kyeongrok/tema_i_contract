const TemaToken = artifacts.require("./TemaToken.sol");

contract('TemaToken', (accounts) => {
    it("mint", () => {
        return TemaToken.deployed().then(temaToken => {
            temaToken.mint("0x5E0358F7C455B58E56dD35C4FB721fA315c57Df8", 10);

            return temaToken.balanceOf("0x5E0358F7C455B58E56dD35C4FB721fA315c57Df8")
                .then(balance => {
                    console.log(balance);
                    // assert.equal(10, balance)
                });

        });
    });

    it("transfer", () => {
        return TemaToken.deployed().then(temaToken => {

            const user1 = "0xf0B2e4237BB53Ec4b7F2428c113d4eC266290602";
            const user2 = "0x5E0358F7C455B58E56dD35C4FB721fA315c57Df8";
            temaToken.mint(user1, 100);

            temaToken.transfer(user2, 20);
            return temaToken.balanceOf(user2)
                .then(balance => {
                    // console.log(balance);
                    assert.equal(30, balance)
                });

            return temaToken.balanceOf(user1)
                .then(balance => {
                    // console.log(balance);
                    assert.equal(80, balance)
                });
        });
    });

});