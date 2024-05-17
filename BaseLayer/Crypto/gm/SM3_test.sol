// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "./sm3.sol";

contract TestSM3 {
    function testSM3Hash() public {
        bytes memory input = "Hello, world!";
        bytes32 expectedOutput = 0x6e9b9b3d4f7a4fef3cc3e10a8c16d168f7b3f621b6d7c3d5c270f8e01d5f3c42;

        bytes32 result = bytes32(abi.encodePacked(SM3.sm3FinalHash(input)));

        assert(compareBytes32(result, expectedOutput));
    }
    function compareBytes32(bytes32 a, bytes32 b) internal pure returns (bool) {
        return a == b;
    }
}
