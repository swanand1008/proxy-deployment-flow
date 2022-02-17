//SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "hardhat/console.sol";

contract WorkspaceStorageV1 {
     uint public  spaceIDCounter;
    struct Space {
        uint spaceID;
        uint hourlyRate;
        uint numSeats;
        uint numActiveCheckIns;
        string dataURI;
        bool available;
        address[] managers;
        //address[] checkInUsers;
        address owner;
    }
    mapping (uint256 => Space) public spaces; 

    modifier onlyManager(uint256 _spaceID){
        Space storage space = spaces[_spaceID];
        bool status;
        for(uint i = 0; i < space.managers.length; i++ ){
            if(space.managers[i] == msg.sender){
                status = true;
            }
        }
        require(status == true, "You are not Manager");
        _;
    }

    modifier onlyowner(uint256 _spaceID){
        require(spaces[_spaceID].owner == msg.sender);
        _;
    }

     function setHourlyRate(uint256 _spaceID, uint256 _rate) external onlyowner(_spaceID) returns(bool){
        spaces[_spaceID].hourlyRate = _rate;
        return true;
    }
}
