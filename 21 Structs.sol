// Struct
// Structs are a way to combine/group relative data together

contract Struct {
    // Declaration of the struct:
    struct Car {
        string model;
        uint256 year;
        address owner;
    }

    Car public car; // state variable as a struct
    Car[] public cars; // dynamic array of struct

    mapping(address => Car[]) public carsByOwner; // mapping of cars by owner

    // How to initialize the struct
    // There are three ways of initialize a struct
    function examples() external {
        Car memory toyota = Car("Toyota", 1999, msg.sender); // here the order matters
        Car memory bmw = Car({model: "BMW", year: 2022, owner: msg.sender}); // here the order does not matter
        Car memory tesla; // Default values

        tesla.model = "tesla";
        tesla.year = 2022;
        tesla.owner = msg.sender;

        // lets put the cars in state variable, because now are only into the memory

        cars.push(toyota);
        cars.push(bmw);
        cars.push(tesla);

        // we can initialize the struct and put thme directly into the state variable. No need to make memroy variable first

        cars.push(Car("Ferrari", 2022, msg.sender)); // equivalent to initialize into memory and push into the state variable

        // Lets' get the first car and load it into memory:

        Car memory _car = cars[0];
        _car.model;
        _car.year;
        _car.owner;

        // If we want to modify the data into the struct, we need to declare it as storage, not memory
        Car memory _carForEdit = cars[0];
        _carForEdit.model = "Toyota2";
        _carForEdit.year = 1990;

        // We can use the delete word to reset a struct:

        delete cars[1];
    }
}
