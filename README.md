# forge-starter template

<p>
    <a href="https://github.com/zaskoh/forge-starter/actions/workflows/test.yml">
        <img alt="GitHub Workflow Status" src="https://github.com/zaskoh/forge-starter/workflows/test/badge.svg?style=flat-square">
    </a>
</p>

# Documentation
[Checkout foundry](https://book.getfoundry.sh/)

### Starting template for new foundry projects to get going with solidity
The template comes with:
- the [forge standard](https://book.getfoundry.sh/forge/forge-std) library
- [solmate](https://github.com/transmissions11/solmate) from transmissions11
- an contract example with tests and a deploy script
- a yul example to also write yul contracts and implement tests for it
- github workflow for testing

---

### todos after installing the template
- If you don't want to work with a yul-contract you can remove:
    - /yul
    - /test/YulExample.t.sol
    - /test/lib/
    - /src/YulExample.sol
    - remove ffi = true in foundry.toml
- remove .github/workflows if you don't need them / want them
- checkout .env.example and copy it to .env
- remove solemate if you don't need it (forge remove solmate)

---

## Development
```bash
forge install
forge test

// use after installing / removing a dependency
forge remappings > remappings.txt

// update dependencies
forge update lib/solmate

// gas report
forge test --gas-report

// update gas-snapshot
forge snapshot
```