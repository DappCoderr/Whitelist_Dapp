// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Whitelist.sol";

contract NFT is ERC721Enumerable, Ownable{

    constructor(address contractAddress) ERC721("Crypto NFT", "CN"){
        instenceOfWhitelist = Whitelist(contractAddress);
        tokenReserved = instenceOfWhitelist.maxNumberOfWhiteListUser;
    }

    Whitelist instenceOfWhitelist;
    uint256 constant public nft_price = 0.1 ether;
    uint256 constant public maxTokenId = 20;
    uint256 public reservedTokens;
    uint256 public reservedTokensClaimed = 0;

    function mint() payable public {
        require(totalSupply() + reservedTokens - reservedTokensClaimed < maxTokenIds, "EXCEEDED_MAX_SUPPLY");

        if(instenceOfWhitelist.whilelistAddresses[msg.sender] && msg.value <= nft_price){
            require(balanceOf(msg.sender) == 0, "ALREADY_OWNED");
            reservedTokensClaimed += 1;
        }else{
            require(msg.value >= nft_price, "NOT_ENOUGH_ETHER");
        }
        uint256 tokenId = totalSupply();
        _safeMint(msg.sender, tokenId);
    }

    function withdraw() {
        address _owner = owner();
        uint256 amount = address(this).balance;
        (bool sent, ) = _owner.call{value: amount}("");
        require(sent, "Failed to send Ether");
    }
}