// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Modifiers
contract FunctionModifiers {
    bool public paused;
    uint256 public count; // default 0

    modifier whenNotPaused() {
        require(!paused, "Contract is paused");
        _;
    }

    modifier checkValue(uint256 _x) {
        require(_x < 100, "X > 100");
        _;
    }

    modifier sandwich() {
        count += 10;
        _;
        count *= 2;
    }

    function inc() external whenNotPaused {
        count += 1;
    }

    function dec() external whenNotPaused {
        count -= 1;
    }

    function set() external {
        paused = !paused;
    }

    function incrementBy(uint256 _x) external whenNotPaused checkValue(_x) {
        count += _x;
    }

    function testSandwich() external whenNotPaused sandwich {
        count += 1;
    }
}
