# forge-yul-starter template

# Documentation
[Checkout foundry](https://book.getfoundry.sh/)

### Starting template to start develop a yul contract
The template comes with:
- the [forge standard](https://book.getfoundry.sh/forge/forge-std) library
- a yul-contract example to write yul contracts and implement tests for it
- an example how to test your yul contract via an interface or direct callings

---

### notes
- yul contracts go into /yul
- if your yul contract adhears to a clean abi, you can use a interface in /src for easier testing
- if you have problems, checkout /test/lib/YulDeployer.sol and follow comments

---

## Development
```bash
forge install
forge test

// use after installing / removing a dependency
forge remappings > remappings.txt

// update dependencies
forge update lib/xxxx

// gas report
forge test --gas-report

// update gas-snapshot
forge snapshot
```