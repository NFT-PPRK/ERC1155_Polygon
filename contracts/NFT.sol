// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC1155 {
    using Counters for Counters.Counter;
    Counters.Counter private currentTokenId;
    
    constructor() ERC1155("NFT") {}
    
    function mintTo(address recipient)
        public
        returns (uint256)
    {
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _mint(recipient, newItemId, 1, " ");
        return newItemId;
    }
}