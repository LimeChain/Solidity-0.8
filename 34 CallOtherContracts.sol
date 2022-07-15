// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// There are several ways to call another contract:

contract CallTestContract {
    // The first one is to pass address and then to initialize it:
    function setX(address _test, uint256 _x) external {
        TestContract(_test).setX(_x);
    }

    // The second one is to pass it as a type and omit initialization process
    function setXasAType(TestContract _test, uint256 _x) external {
        _test.setX(_x);
    }

    // How to call function on the other contract and send ETH?:
    function setAndReceiveEther(TestContract _test, uint256 _x)
        external
        payable
    {
        _test.setXandReceiveEther{value: msg.value}(_x);
    }

    //How to return multiple values?:
    function getXAndValue(TestContract _test)
        external
        view
        returns (uint256 x, uint256 value)
    {
        (x, value) = _test.getXandValue();
    }
}

contract TestContract {
    uint256 public x;
    uint256 public value = 123;

    function setX(uint256 _x) external {
        x = _x;
    }

    function getX() external view returns (uint256) {
        return x;
    }

    function setXandReceiveEther(uint256 _x) external payable {
        x = _x;
        value = msg.value;
    }

    function getXandValue() external view returns (uint256, uint256) {
        return (x, value);
    }
}
