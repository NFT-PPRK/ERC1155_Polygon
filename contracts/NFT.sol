// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC1155 {
    using Counters for Counters.Counter;
    Counters.Counter private currentTokenId;
    // constructor(string name, string symbol)
    // constructor("NFTTutorial", "NFT")
    constructor() ERC1155("") {}
    
    function mintTo(address recipient)
        public
        returns (uint256)
    {
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        // _mint(address account, unit256 id, unit 256 amount, bytes data)
        // creates amount tokens of token type id, and assign them to account
        _mint(recipient, newItemId, 1, " ");
        // _safeMint(address to, unit256 tokenId)
        // internal function to safely mint a new token 
        //_safeMint(recipient, newItemId);
        return newItemId;
    }
}