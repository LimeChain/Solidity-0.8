// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Ownable {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not Owner");
        _;
    }

    modifier notZeroAddress() {
        require(msg.sender != address(0), "Zero address");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function setOwner(address _owner) external notZeroAddress onlyOwner {
        owner = _owner;
    }
}
