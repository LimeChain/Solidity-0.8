// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Visibility defines how contract or other contracts have access to state variables or functions
// Four visibilities
// Private - only inside contract
// Internal - only inside and child contracts
// Public - inside and outside contracts
// Extenral - only outside contract

/*
A
private pri()
internal inter()
public pub()
external ext()
B is A // Inheritance
inter()
pub()
A <----------- C
pub()
ext()
*/

contract VisibilityBase {
    uint256 private x = 0;
    uint256 internal y = 1;
    uint256 public z = 2;

    function privateFunc() private pure returns (uint256) {
        return 0;
    }

    function internalFunc() internal pure returns (uint256) {
        return 100;
    }

    function publicFunc() public pure returns (uint256) {
        return 200;
    }

    function externalFunc() external pure returns (uint256) {
        return 300;
    }

    function examples() external view {
        x + y + z;
        privateFunc();
        internalFunc();
        publicFunc();

        // there is one hack to access external function here:
        // This is as calling another contract, but calling this contract // This is a hack and GAS inneficient so don't do it
        this.externalFunc(); // this is making external call into this contract.
    }
}

contract VisibilityChild is VisibilityBase {
    function exmaple2() external view {
        y + z;
        internalFunc();
        publicFunc();
    }
}
