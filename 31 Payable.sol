// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Payable
// Payable keyword add functionality to send and receive ether

contract Payable {
    address payable public owner;

    constructor() {
        // if we don't cast the type to payable the compilation will fail because the owner is of type payable but the initialization with msg.sender is of type address
        owner = payable(msg.sender);
    }

    function deposit() external payable {}

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
