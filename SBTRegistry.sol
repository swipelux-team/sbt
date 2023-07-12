// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {SBT} from "./SBT.sol";

contract SBTRegistry is OwnableUpgradeable
{
    mapping(uint256 => mapping(address => uint256)) private permissions;
    SBT public sbt;

    constructor(address sbtContractAddress) OwnableUpgradeable() {
        sbt = SBT(sbtContractAddress);
    }

    modifier hasSBT() {
        require(currentTokenId() != uint256(0), "caller has no SBT issued");
        _;
    }

    /// @notice Grants permission for a dApp to retrieve user data
    /// @dev User must have an SBT issued and grants permission by himself
    /// @param dAppAddress the dApp address permission to be granted to
    /// @param level user data disclosure level 
    function grantPermission(address dAppAddress, uint256 level) external hasSBT {
        permissions[currentTokenId()][dAppAddress] = level;
        emit DappPemissionGranted(_msgSender(), currentTokenId(), dAppAddress, level);
    }

    /// @notice Revokes permission for a dApp to retrieve user data
    /// @dev User must have an SBT issued and grants permission by himself
    /// @param dAppAddress the dApp address permission to be revoked from
    function revokePermission(address dAppAddress) external hasSBT {
        delete permissions[currentTokenId()][dAppAddress];
        emit DappPemissionRevoked(_msgSender(), currentTokenId(), dAppAddress);
    }

    /// @notice Returns allowance for a dApp to retrieve user data of specific level
    /// @param dAppAddress the dApp address permission to be checked for
    /// @param userAddress the user address permission to be revoked for
    /// @param level disclosure level to be check for
    function isAllowed(address dAppAddress, address userAddress, uint256 level) external view returns(bool) {
        uint256 tokenId = sbt.currentTokenId(userAddress);
        require(tokenId != 0, "user has no SBT issued");
        return permissions[tokenId][dAppAddress] >= level;
    }

    function currentTokenId() internal view returns (uint256) {
        return sbt.currentTokenId(_msgSender());
    }

    event DappPemissionRevoked(address user, uint256 tokenId, address dAppAddress);
    event DappPemissionGranted(address user, uint256 tokenId, address dAppAddress, uint256 level);
}
