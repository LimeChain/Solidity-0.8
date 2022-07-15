// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Events
// Allows to write data on the blockchain
// Log something that happened
// Can be a cheap alternative to store something into datatype if you don't need later the contract to retrieve it

contract Event {
    event Log(string message, uint256 value);
    // If you want to search for a particular event by the params that it was logged, we can use the keyword indexed to make the param indexed
    event IndexedLog(address indexed sender, uint256 val);
    event TestIndexedLog(
        address indexed sender,
        uint256 indexed val,
        int256 indexed val2
    );

    function example() external {
        // Please note that this is not a view function. This is a transactional function. The params into the event will be stored onto the blockchain
        emit Log("Ogi", 123);
        // If this event is emitted 10 times by one user and then by other, we can quickly filter the events by indexed params
        // The indexed params are limited to 3 per event
        emit IndexedLog(msg.sender, 726);
    }
}
