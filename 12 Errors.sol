// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Error {
    uint256 public num = 123;
    event Log(address);
    error myError(address caller, uint256 i);

    function testRequire(uint256 _i) external {
        require(_i < 10, "i > 10");
        // some
        emit Log(msg.sender);
    }

    function testRevert(uint256 _i) external pure {
        if (_i > 10) {
            revert("i > 10");
        }
    }

    function testAssert() external view {
        assert(num == 123);
    }

    function setNum(uint256 _x) external {
        num = _x;
    }

    // Custom
    function customError(uint256 _i) external view {
        if (_i > 10) {
            revert myError(msg.sender, _i);
        }
    }

    function testLongRequire(uint256 _i) external pure {
        require(
            _i < 10,
            "Error Error Error Error Error Error Error Error Error Error Error Error Error"
        );
    }
}
