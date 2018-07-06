const TemaToken = artifacts.require("./TemaToken.sol");

contract('TemaToken', (accounts) => {
    it("mint", () => {
        return TemaToken.deployed().then(temaToken => {
            temaToken.mint("0x5E0358F7C455B58E56dD35C4FB721fA315c57Df8", 10);

            return temaToken.balanceOf("0x5E0358F7C455B58E56dD35C4FB721fA315c57Df8")
                .then(balance => assert.equal(10, balance));

        });
    });

});