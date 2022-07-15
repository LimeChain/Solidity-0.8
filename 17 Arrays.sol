// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Arrays in solidity can be dynamic or fixed size
// Initialization
// Insert (push), get, update, delete, pop, length
// Creating array in memory
// Returning array from function
contract Array {
    // dynamic array
    uint256[] public myArr = [1, 2, 3]; // initialize dynamic size

    // fixed size array
    // initialize fixed size array. If the size of initialization does not mach the size of declaration, the contract does not compile
    uint256[5] public fixedArr = [1, 2, 3, 4, 5];

    // Operations
    function example() external {
        myArr.push(4); // nums array = [1,2,3,4] push an element to the end of the array; // we cannot push element to a fixed size array

        // read element
        uint256 x = myArr[1];

        // update element
        myArr[2] = 777; // [1, 2, 777, 4]

        //delete element - it does not remove it, but make an default variable and length is same
        delete myArr[2]; // [1, 2, 0, 4]

        //remove last element from the array:
        myArr.pop(); // [1, 2, 0]

        //legth of the array
        myArr.length;

        // Create Array in MEMORY
        // Please note: Arrays in memory can be only fixed size! push and pop does not work!
        uint256[] memory memoryArray = new uint256[](5);

        //update element
        memoryArray[1] = 123;
    }

    function returnArray() external pure returns (uint256[] memory) {
        uint256[] memory memoryArray = new uint256[](3);
        memoryArray[0] = 123;
        return memoryArray; // returning an array from function is not recommended. The reason is because the same as for loops
    }
}
