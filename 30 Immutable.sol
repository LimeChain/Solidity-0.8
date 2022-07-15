// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Immutable
// We have a state variable that will be initialized when this contract is deployed and then never changed

contract Immutable {
    address public immutable owner = msg.sender; // we can put immutable (kind like a constant but initializable when the contract is deployed
}

contract Immutable2 {
    address public owner = msg.sender; // we can put immutable (kind like a constant but initializable when the contract is deployed
}
