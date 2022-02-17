// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./WorkspaceStorageV1.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract Workspace is Initializable, ERC20Upgradeable, OwnableUpgradeable, UUPSUpgradeable, WorkspaceStorageV1{

    function initialize() public initializer {
        __ERC20_init("Croissants", "CRS");
        __Ownable_init();
        __UUPSUpgradeable_init();

        _mint(msg.sender, 200000000000000000000000 * 10 ** decimals());
    }

    function _authorizeUpgrade(address newImplementation) internal onlyOwner override{
    }

    function createSpace(uint _hourlyRate,uint _numSeats,string memory _dataURI)external returns(bool){
        Space storage space = spaces[spaceIDCounter+1]; 
        space.spaceID = spaceIDCounter+1;
        space.hourlyRate = _hourlyRate;
        space.numSeats = _numSeats;
        space.dataURI = _dataURI;
        space.owner = msg.sender;
        spaceIDCounter = spaceIDCounter+1;
       // emit SpaceCreated(msg.sender, spaceIDCounter);
        return true;
    }
}