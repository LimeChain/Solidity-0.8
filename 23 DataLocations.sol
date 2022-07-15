// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// DATA LOCATIONS:
// STORAGE MEMORY CALLDATА
// When we use dynamic datatype as variable, we need to declare its data location
// Storage means that the variable is a state variable
// Memory means that the data is loaded into memory
// Calldata is like memory but we can use it as a function inputs:

contract DataLocations {
    struct MyStruct {
        uint256 number;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    // 74628
    // 73514
    function example(uint256[] calldata y, string calldata s)
        external
        returns (uint256[] memory)
    {
        myStructs[msg.sender] = MyStruct({number: 123, text: "Text"});

        // We use storage to update data and memory to read the data
        // We are using storage so the myStruct text will be updated
        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "Text1";

        _internal(y);

        // We can modify here the struct, once the function is done executing, the change will not be saved
        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.text = "Text2";
        readOnly.number = 456;

        uint256[] memory myArr = new uint256[](3); // for arrays initialized into memory, we can only create fixed sizes arrays, not dynamic one
        myArr[0] = 4363453;
        return myArr;
    }

    // Calldata is like memory but for function inputs. Why - it has the pottential to save gas.
    // since data type declared as calldata is not modifiable means that we cannot change the values inside, we can save gas when we pass this input to another function.

    // If the input param here was memory, solidity will take the input from the upper function and copy each element of the array and will create new uint array.
    // So using calldata we save one copying it.
    function _internal(uint256[] calldata y) private {
        uint256 x = y[0];
    }
}
