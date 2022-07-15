// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Calling Parent Constructor
// There are 2 ways of calling parent constructor:

contract S {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract T {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

contract U is S("NAME"), T("TEXT") {
    // One way is directly to pass constructor params in the inheritance declaration. This only works when you know the params when you write the code
}

// We want to pass dynamic inputs for the constructor of both contracts
contract UU is S, T {
    constructor(string memory _name, string memory _text) T(_text) S(_name) {
        // pass params upon deploying contract // There is no order here. We can call them in different order no matter of order of inheritance
    }
}

// Combination of two approaches:
contract UUU is S, T("text") {
    constructor(string memory _name, string memory _text) S(_name) {}
}

// Order of initialization is determined by the order of inheritance, not the order of calling the parent constructors!
// Order is S, T, UU or S, T, UUU
