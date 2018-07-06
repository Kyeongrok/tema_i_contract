const TemaToken = artifacts.require("./TemaToken.sol");

contract('TemaToken', (accounts) => {
    it("mint", () => {
        return TemaToken.deployed().then(temaToken => {
            temaToken.mint("0xf0b2e4237bb53ec4b7f2428c113d4ec266290602", 1000);

            return temaToken.balanceOf("0xf0b2e4237bb53ec4b7f2428c113d4ec266290602")
                .then(balance => assert.equal(1000, balance));

        });
    });

});