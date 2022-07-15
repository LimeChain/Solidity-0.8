// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// There are two ways to remove element: by shifting and by replacing

// Shifting:
contract ArrayShift {
    uint256[] public arr;

    function example() external {
        arr = [1, 2, 3];
        delete arr[1]; // [1, 0, 3] --> [1, 3]
    }

    // [1, 2, 3] -- remove(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5, 6] -- remove(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5, 6]
    // [1] -- remove(0) --> [1] --> []
    // recap: copy elements from right to left starting of one plus the element that we want to delete
    function remove(uint256 _index) external {
        require(_index < arr.length, "index out of bound");
        // THIS IS NOT A GAS EFFICIENT WAY
        for (uint256 i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function returnArray() external view returns (uint256[] memory) {
        return arr;
    }
}

// THIS IS MORE GAS EFFICIENT WAY
contract ArrayReplace {
    uint256[] public arr = [1, 2, 3, 4];

    function remove(uint256 _index) external {
        require(_index < arr.length, "indec out of bound");

        arr[_index] = arr[arr.length - 1];
        arr.pop();
    }

    function returnArray() external view returns (uint256[] memory) {
        return arr;
    }
}
