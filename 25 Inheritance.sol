// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Inheritance -
contract A {
    // We need to specify that the function can be inherited and overriden
    function foo() public pure virtual returns (string memory) {
        return "A";
    }

    function bar() public pure virtual returns (string memory) {
        return "A";
    }

    function baz() public pure returns (string memory) {
        return "A";
    }
}

contract B is A {
    function foo() public pure override returns (string memory) {
        return "B";
    }

    function bar() public pure override returns (string memory) {
        return "B";
    }
}
