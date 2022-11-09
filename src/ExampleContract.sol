// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract ExampleContract {
    bool public isAlive;

    function switchAlive() external {
        isAlive = !isAlive;
    }
}
