// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract forAndWhileLoops {
    function loops() external pure {
        for (uint256 _i = 0; _i < 10; _i++) {
            // code
            if (_i == 3) {
                continue;
            }

            if (_i == 5) {
                break;
            }
        }
        uint256 u = 0;
        while (u < 10) {
            // some code
            u += 1;
        }
    }
}
