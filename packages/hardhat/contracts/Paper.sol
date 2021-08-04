pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC721/IERC721.sol';

contract Validator {
  mapping (address => string[]) validatorFields;
  mapping (address => uint256) validatorCollateral;
  mapping (address => bool) scholars;
  mapping (address => string []) fields;

  function onboardValidators (
    address _validatorId,
    string [] memory _fields
    ) public payable{
      require(validatorFields[_validatorId].length == 0 , 'already onboard!');
      require( _fields.length != 0, 'fields cannot be empty');
      validatorFields[_validatorId] = _fields;
      validatorCollateral[_validatorId] = msg.value;
    }

    function onboardReviewers (
      address _scholarId,
      string [] memory _fields
      ) public {
        require(validatorFields[msg.sender].length != 0 , ' not a validator ');
        require(scholars[_scholarId] == false , 'already onboard');
        require(_fields.length != 0 ,"cannot enter empty fields");
        scholars[_scholarId] = true;
        fields[_scholarId] = _fields;
      }

}



/*pragma solidity >=0.8.0 <0.9.0;
// SPDX-License-Identifier: MIT

import "hardhat/console.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

enum PublicationStage {
    Draft,
    Preprint,
    Published
}

enum ReviewerDecision {
    Accept,
    MinorRevision,
    MajorRevision,
    Reject
}

struct Review {
    uint256 paperId;
    address reviewerId;
    ReviewerDecision reviewerDecision;
    string commentsCid;
}

contract Paper is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // owner of a paper
    mapping(uint256 => address) owner;

    // authors of a paper
    mapping(uint256 => address[]) authors;

    // publication stage of a paper
    mapping(uint256 => PublicationStage) pubStage;

    // references used in a paper
    mapping(uint256 => uint256[]) references;

    // reviews of a paper
    mapping(uint256 => mapping(address => Review)) reviews;

    // funds provided by backers
    mapping(uint256 => mapping(address => uint256)) funds;

    // validator who claimed a paper for a publishing cycle
    mapping(uint256 => address) validator;

    constructor() ERC721("Paper", "PAPR") {}

    function uploadDraft(
        address _owner,
        address[] memory _authors,
        uint256[] memory _references,
        string memory tokenURI
    ) public returns (uint256) {
        require(msg.sender == _owner, "Draft should be uploaded by owner");
        _tokenIds.increment();

        uint256 newPaperId = _tokenIds.current();
        _safeMint(_owner, newPaperId);
        _setTokenURI(newPaperId, tokenURI);

        owner[newPaperId] = _owner;
        authors[newPaperId] = _authors;
        pubStage[newPaperId] = PublicationStage.Draft;
        references[newPaperId] = _references;

        return newPaperId;
    }
}
*/
