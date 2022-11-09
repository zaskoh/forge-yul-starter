// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

/// @dev use the interface description of your yul contract for easiert testing and accessing stuff
interface YulExample {
    /// @dev test any calldata stuff - if you implement a clean abi in your yul contract you can use the interface like you could on a normal sol contract
    function test() external payable;
}
