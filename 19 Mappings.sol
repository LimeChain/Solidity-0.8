// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Mapping
// Mappings are like dictionaries into Python for example
// ["ivan", "georgi", "dimitar"] if we want to see if petko is inside the array, we have to make 3 itterations (lookups) and look if the petko is included.
// {"ivan" : true, "georgi" : true, "dimitar": true} // using a mapping we can find david using only one lookup

contract Mapping {
    // Key type => Value type
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => bool)) public isFriend; // nested mapping

    function setBalance() external {
        balances[msg.sender] = 123;
    }

    function getBalanceOfAddress1() external view returns (uint256) {
        return balances[address(1)];
    }

    function deleteBalances(address _owner) external {
        delete balances[_owner]; // will be reset to default value and in this case it is uint 0
    }

    function setFriends(address _friend) external {
        isFriend[msg.sender][_friend] = true;
    }
}
