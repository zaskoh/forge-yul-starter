// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import {ExampleContract} from "../src/ExampleContract.sol";

contract ExampleContractTest is Test {
    ExampleContract public exampleContract;

    function setUp() public {
        exampleContract = new ExampleContract();
    }

    function testStartState() public {
        assertFalse(exampleContract.isAlive());
    }

    function testSwitchToDead() public {
        assertFalse(exampleContract.isAlive());
        exampleContract.switchAlive();
        assertTrue(exampleContract.isAlive());
    }
}
