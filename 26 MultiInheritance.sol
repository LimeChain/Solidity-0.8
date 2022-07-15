// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Multiple inheritance
// Order of inheritance - most based like to most derived:

/*
    X
  / |
Y   |  
  \ |
    Z
*/
// Order: X, Y, Z

/*
    X
  /   \
Y      A
|      |
|      B
 \    /
    Z
*/

// Order: X, Y, A, B, Z

contract X {
    function foo() external pure virtual returns (string memory) {
        return "X";
    }

    function bar() external pure virtual returns (string memory) {
        return "X";
    }

    function x() external pure returns (string memory) {
        return "X";
    }
}

contract Y is X {
    function foo() external pure virtual override returns (string memory) {
        return "Y";
    }

    function bar() external pure virtual override returns (string memory) {
        return "Y";
    }

    function y() external pure returns (string memory) {
        return "Y";
    }
}

contract Z is X, Y {
    function foo() external pure override(X, Y) returns (string memory) {
        return "Z";
    }

    function bar() external pure override(X, Y) returns (string memory) {
        return "Z";
    }
}
