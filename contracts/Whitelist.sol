// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract Whitelist{
    constructor(uint8 _maxNumberOfWhiteListUser){
        maxNumberOfWhiteListUser = _maxNumberOfWhiteListUser;
    }
    
    uint8 public maxNumberOfWhiteListUser;
    uint8 public numberOfAddressWhitelisted;

    mapping(address => bool) public whilelistAddresses;

    function addAddressToWhitelist() public{
        require(!whilelistAddresses[msg.sender], "You are already whitelisted");
        require(numberOfAddressWhitelisted<=maxNumberOfWhiteListUser, "limit reach, No more white listing");
        whilelistAddresses[msg.sender] = true;
        numberOfAddressWhitelisted++;
    }
}
