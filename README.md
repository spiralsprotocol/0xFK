# 0xFK - Proof Of Concept

## Goal:

There's an entire set of addresses that should not be interacted with to stay compliant with OFAC -- the US Office of Foreign Assets Control. They recently started adding cryptocurrency addresses to their list, and this provides a simple way to stay compliant.

**Please DYOR and don't take this as legal advice.**

## Important Files

`sanctioned.sol` maintains OFAC list for wallets and creates a modifier that can be imported to protect routes for other solidity methods.

`demo.sol` shows how to use sanctioned.sol's `notBlacklisted` modifier in a simple method called `doThing()`

## Todos:

- [ ] deploy
- [ ] set initial ofac list https://www.opensanctions.org/search/?scope=default&schema=CryptoWallet
- [ ] consider using IPFS instead of storing addresses on chain--> not sure which is best

## Setup

Note this has not been pushed to prod, been thoroughly tested, or anything else. It was built in ~1 hour and a proof of concept. We'll continue building this and make it production ready over time-- we welcome contributors.

**Config Dev Env:**

```
npm install -g @celo/ganache-cli
ganache-cli --port 7545
```

**Deploying:**

```
// make changes
truffle migrate --network test
truffle console --network test
```

**Manual Testing:**

```
sanctionedContract = await sanctioned.deployed()
demoContract = await demo.deployed()

demoContract.doThing()
>> success; ADDRESS returned
sanctionedContract.addAddress(ADDRESS)
demoContract.doThing()
>> error
sanctionedContract.removeAddress(ADDRESS)
demoContract.doThing()
>> success; ADDRESS returned
```
