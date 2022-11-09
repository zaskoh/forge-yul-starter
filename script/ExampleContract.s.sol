// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import {ExampleContract} from "../src/ExampleContract.sol";

/// @dev simple deploy script
contract ExampleContractScript is Script {
    /// @dev do your setup here
    function setUp() public {}

    /// @dev entry point
    function run() public returns (ExampleContract exampleContract) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // dont forget to set in .env
        vm.startBroadcast(deployerPrivateKey);
        exampleContract = new ExampleContract();
        vm.stopBroadcast();
    }
}
