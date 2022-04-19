// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/IERC1155MetadataURI.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "./StringsAction.sol";

contract NFT is ERC1155 {
    using Counters for Counters.Counter;

    Counters.Counter private currentTokenId;
    
    string public baseTokenURI;
    //string public _uri;

    constructor() ERC1155(baseTokenURI) {}
    //constructor(string memory uri_) {
    //    _setURI(uri_);
    //}

    
    function mintTo(address recipient) public returns (uint256) {
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _mint(recipient, newItemId, 10, " ");
        return newItemId;
    }
    
    // /// @dev Returns an URI for a given token ID
    // function _baseURI() internal view virtual override returns (string memory) {
    //     return baseTokenURI;
    // }
    /// @dev Sets the base token URI prefix.
    function setBaseTokenURI(string memory _baseTokenURI) public {
        baseTokenURI = _baseTokenURI;
        _setURI(_baseTokenURI);
    }


    
  function tokenUri(
    uint256 _id
  ) public view returns (string memory) {
    return StringsAction.strConcat(baseTokenURI,
      Strings.toString(_id)
    );
  }
    //     function uri(uint256) public view virtual override returns (string memory) {
    //     return _uri;
    // }

    // function _setURI(string memory newuri) internal virtual {
    //     _uri = newuri;
    // }
}