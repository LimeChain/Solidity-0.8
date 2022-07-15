// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// 3 Ways to send ether from a contract:
// transfer - 2300 gas, reverts,
// send - 2300 gas, returns bool,
// call - all gas, returns bool and data -> low level functions

// Mostly is used transfer or call
contract SendEther {
    constructor() payable {}

    receive() external payable {}

    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(123); // 123 wei
    }

    function sendViaSend(address payable _to) external payable {
        bool sent = _to.send(123); // 123 wei
        require(sent, "Send failed!");
    }

    function sendViaCall(address payable _to) external payable {
        (bool success, ) = _to.call{value: 123}(""); // 123 wei
        require(success, "Send failed!");
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}

contract EthReceiver {
    event Log(uint256 amount, uint256 gasLeft);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}
