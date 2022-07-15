// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// if we got array we can loop and get all elements
// when we've got a mapping, we cannot iterate through it, unless we internally keep track of all of the keys of the mapping
contract IterableMapping {
    mapping(address => uint256) public balances;
    mapping(address => bool) public inserted;
    address[] public keys;

    function setBalance(address _key, uint256 _val) external {
        balances[_key] = _val;
        // After this function, we can get the size of the mapping and then iteratte through all the keys in the mapping so we can get all the values
        if (!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    function getSize() external view returns (uint256) {
        return keys.length;
    }

    function get(uint256 _index) external view returns (uint256) {
        return balances[keys[_index]];
    }
}
