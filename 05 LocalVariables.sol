// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Local variables
contract LocalVariables {
    uint256 public i;
    bool public b;

    function example() external {
        uint256 x = 123;
        bool f = false;
        // some code

        x = 456;
        f = true;

        // some code

        b = true;
    }
}
