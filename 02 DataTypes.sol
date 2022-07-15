// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Data Types
contract DataType {
    bool public b = true;
    uint256 public u = 123; // 0 to 2*256 - 1;
    int256 public i = -456; // - 2**255 to 2**2255 -1;
    address public myAddr = 0xE4207232360524D139F45dC034E267D98B603475;
    bytes32 public myBytes =
        0x626c756500000000000000000000000000000000000000000000000000000000;

    uint256 public maxInt = type(uint256).max;
    uint256 public minInt = type(uint256).min;
}
