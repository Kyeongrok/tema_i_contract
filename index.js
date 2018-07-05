const fs = require('fs');
const Web3 = require('web3');
// this should be testrpc, run it with $ testrpc
const web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'));
const compilers = require('./compilers');

const tokenFile = fs.readFileSync('./contracts/ReserveToken.sol');

// other useful things
const getBalance = (acct) => web3.fromWei(web3.eth.getBalance(acct), 'ether').toNumber();
const balances = web3.eth.accounts.map(account => getBalance(account))
console.log('balances:',balances);





