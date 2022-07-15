// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Enums
// Enums are a way to express more choises
contract Enum {
    enum Status {
        None,
        Pending,
        Shipped,
        Completed,
        Rejected,
        Canceled
    }

    // Declare state variable of type Status
    Status public status;

    struct Order {
        address buyer;
        address sender;
        Status status;
    }

    // Array of orders
    Order[] public orders;

    function get() external view returns (Status) {
        return status;
    }

    function set(Status _status) external {
        status = _status;
    }

    function reset() external {
        delete status;
    }
}
