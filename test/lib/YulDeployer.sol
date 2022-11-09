// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";

contract YulDeployer is Test {
    // we use ffi to compile our yul contract and use the bytecode to deploy the contract
    // fileName of the contract - needs to be in /yul/Xxx.yul
    // fails if cant deploy contract - use "solc --yul yul/Xxx.yul" to check for specific compile errors
    function deploy(string memory fileName) public returns (address) {
        string memory cmd = string.concat(
            'cast abi-encode "f(bytes)" $(solc --strict-assembly --optimize --optimize-runs 200 --bin yul/',
            string.concat(fileName, ".yul | tail -2)")
        );

        string[] memory inputs = new string[](3);
        inputs[0] = "bash";
        inputs[1] = "-c";
        inputs[2] = cmd;

        bytes memory _bytecode = abi.decode(vm.ffi(inputs), (bytes));

        address contractAddress;
        assembly {
            contractAddress := create(0, add(_bytecode, 0x20), mload(_bytecode))
        }

        require(contractAddress != address(0), "contract creation failed");

        return contractAddress;
    }
}
