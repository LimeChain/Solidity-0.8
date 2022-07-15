// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Fallback
// Fallback is a special function that is called when your function does not exists into your contract
// The main use case is to enable direct sending ether:
contract Fallback {
    event Log(string func, address sender, uint256 value, bytes data);

    // if we call some fucntion and it does not exist: this will be called
    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    // another one function:

    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }

    /*
fallback() or receive()?
    Ether is sent to contract
            |
     is msg.data empty?
           /     \
        YES       NO
        /          \
receive() exists?   fallback()      
      /   \
    YES    NO
    /        \
receive()    fallback()
*/
}
