# Dapp Data sharing

Dapp是為了使用者方便共享自己的數位資料而成立的，目的是藉由這個平台，讓使用者可以方便的找尋淺在的資料需要者，然後在平台上交易並且管理自己的數位資料授權情況。

## Installation

```bash
npm install -g truffle
npm install
truffle compile
truffle migrate --reset
npm run dev
```
for running on localhost

```bash
npm install -g truffle
npm install
truffle compile
Configure settings variables to ropsten in truffle.js file:
var infura_apikey = "you need to register in Infura for an Access Token.";
var mnemonic = "< twelve words you can find in metamask/settings/reveal seed words >";
var address = "ropsten address with ether";
truffle migrate --reset --network ropsten
Note: If you receive an error Error: Exceeds block gas limit, you may need to manually set the gas limit for your contract. See the Truffle Configuration documentation for details.
```
