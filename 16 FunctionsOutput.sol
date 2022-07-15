// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// return multiple outputs
// named outputs
// destructure assignments
contract FunctionOutputs {
    function returnMany() external pure returns (uint256, bool) {
        return (3, false);
    }

    function returnNamed() external pure returns (uint256 x, bool f) {
        return (3, true);
    }

    // SAVES GAS because there is one less copy to do
    function returnAssigned() public pure returns (uint256 x, bool f) {
        // public we are going to use this function in another example
        x = 3;
        f = true;
    }

    // Destructuring outputs;
    function destructuringAssignment() external pure returns (uint256 x) {
        (x, ) = returnAssigned();
    }
}
