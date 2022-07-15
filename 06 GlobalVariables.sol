// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Global variables
contract GlobalVariables {
    function globalVars()
        external
        view
        returns (
            address,
            uint256,
            uint256
        )
    {
        address sender = msg.sender;
        uint256 time = block.timestamp;
        uint256 blockNumber = block.number;

        return (sender, time, blockNumber);
    }
}
