// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC1155 {
    using Counters for Counters.Counter;
    Counters.Counter private currentTokenId;

    string public baseTokenURI;
    // ERC 721 Example code
    // constructor(string name, string symbol)
    // constructor("NFTTutorial", "NFT")

    // ERC 1155 Example code 
    // ERC1155("https://game.example/api/item/{id}.json") ERC 1155() ()안에 IFPS URL을 넣는데 아마도 나중에 있을 BaseToekn URL과 관계있을듯? 
    constructor() ERC1155(baseTokenURI) {} 
    
    function mintTo(address recipient)
        public
        returns (uint256)
    {
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        // _mint(address account, unit256 id, unit 256 amount, bytes data)
        // creates amount tokens of token type id, and assign them to account
        _mint(recipient, newItemId, 25, " ");
        // _safeMint(address to, unit256 tokenId)
        // internal function to safely mint a new token 
        //_safeMint(recipient, newItemId);
        return newItemId;
    }
  /// @dev Returns an URI for a given token ID
  // View Functions can be declared view in wich case they promise not to modify the state 
  // internal : 해당함수를 contract 내부, 상속된 contract에서 호출 가능
  // virtual 이랑 override? 
//   function _baseURI() internal view virtual override returns (string memory) {
//     return baseTokenURI;
//   }

  /// @dev Sets the base token URI prefix.
  function setBaseTokenURI(string memory _baseTokenURI) public {
    baseTokenURI = _baseTokenURI;
  }
}