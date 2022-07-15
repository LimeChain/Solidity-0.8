// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// pure vs view
contract ViewAndPureFunctions {
    uint256 public num;

    function add(uint256 _x) external view returns (uint256) {
        return num + _x;
    }

    function addNum(uint256 _x, uint256 _y) external pure returns (uint256) {
        return _x + _y;
    }
}
