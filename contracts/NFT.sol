// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/IERC1155MetadataURI.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";


import "./StringsAction.sol";


contract NFT is ERC1155, Ownable, AccessControl {
    using Counters for Counters.Counter;
    Counters.Counter private currentTokenId;

    string public name;
    string public symbol;
    string public baseTokenURI;
    // mapping (uint256 => uint256) public tokenSupply;
    
    //constructor(string memory _name, string memory _symbol) ERC1155(baseTokenURI) {
    constructor() ERC1155("https://bafybeihh4rqyaxz2tcosxgrvn2zqx7ip6osnj62gor6fugiiaswjy7stxi.ipfs.nftstorage.link/metadata/{id}") {

        name = "NFT Tutorial";
        symbol = "NFT";
    }
    
    function mintTo(address recipient)
        public
        returns (uint256)
    {
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _mint(recipient, newItemId, 10, " ");
        return newItemId;
    }
    function setBaseTokenURI(string memory _baseTokenURI) public {
        baseTokenURI = _baseTokenURI;
        _setURI(_baseTokenURI);
    }

    function tokenUri(uint256 _id) public view returns (string memory) {
        return StringsAction.strConcat(baseTokenURI, Strings.toString(_id));
    }
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC1155, AccessControl) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    // function name() internal view returns (string memory) {
    //     return "polygon erc115
    // }
}