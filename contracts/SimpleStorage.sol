//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract SimpleStorage {
    //boolean,uint,int,address,bytes
    //default function type is internal
    //view and pure functions dont require gas
    uint256 public favouritenumber;

    mapping(string => uint256) public nameToFavouriteNumber;
    struct People {
        uint256 favouriteNumber;
        string name;
    }
    //dynamic array
    People[] public people;

    //0:patrick, 1:nishanth

    function store(uint256 _favouriteNumber) public virtual {
        favouritenumber = _favouriteNumber;
    }

    //view function is just to read the data and doesnt allow for modification

    function retrieve() public view returns (uint256) {
        return favouritenumber;
    }

    //pure function doesnt allow modification and additionally doest allow to retrieve

    // function add() public pure returns(uint256) {
    //     return add(1+1);
    // }

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        //People memory newPerson = People(_fvouriteNumber,_name);
        //people.push(newPerson)
        people.push(People(_favouriteNumber, _name));
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }

    //calldata,memory,storage
    //calldata is a temporary variable which cannot be modified
    //memory is temporary but can be modified
    //storage is permanent and can be modified
}