// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import {YulDeployer} from "./lib/YulDeployer.sol";
import {YulExample} from "../src/YulExample.sol";

contract YulExampleTest is Test {
    YulDeployer yulDeployer = new YulDeployer();
    YulExample yulExample;

    /// @dev deploy the yul contract found in /yul/YulExample.yul
    function setUp() public {
        yulExample = YulExample(yulDeployer.deploy("YulExample"));
    }

    function test00() public {
        (bool success, bytes memory res) = address(yulExample).call(hex"00");
        assertTrue(success);

        address expectedDead;
        assembly {
            expectedDead := mload(add(res, 32))
        }
        assertEq(expectedDead, 0x000000000000000000000000000000000000dEaD);
    }

    function test00ViaInterface() public {
        address res = yulExample.test2001551086();
        assertEq(res, 0x000000000000000000000000000000000000dEaD);
    }

    function test01() public {
        (bool success, bytes memory res) = address(yulExample).call(hex"01");
        assertTrue(success);

        address expectedWeth;
        assembly {
            expectedWeth := mload(add(res, 32))
        }
        assertEq(expectedWeth, 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
    }

    function test01ViaInterface() public {
        address res = yulExample.OjASUJbBfDURrB();
        assertEq(res, 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
    }
}
