// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

import {ERC5192} from "./ERC5192.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SBT is ERC5192, Ownable {
    bool private locked;
    mapping(address => uint256) private userCurrentTokenId;

    constructor(bool _isLocked) ERC5192("Zero ID", "ZEROID", _isLocked)
    {
        locked = _isLocked;
    }

    /// @notice Mints SBT to an address
    /// @param tokenId The identifier for an SBT.
    function safeMint(uint256 tokenId) external {
        require(userCurrentTokenId[_msgSender()] == uint256(0), "user already has an SBT issued");
        _safeMint(_msgSender(), tokenId);
        userCurrentTokenId[_msgSender()] = tokenId;
        if (locked) emit Locked(tokenId);
    }

    /// @notice Revokes particular SBT making no longer accessible by user
    /// @dev Only contract owner (SBT issuer) can revoke SBTs
    /// @param tokenId The identifier for an SBT to be revoked
    function revoke(uint256 tokenId) external onlyOwner {
        require(ownerOf(tokenId) != address(0), "SBT holder not found");
        delete userCurrentTokenId[ownerOf(tokenId)];        
        _burn(tokenId);
    }

    /// @notice Returns current user SBT id: there can be only one SBT per address at a time.
    /// @param userAddress The identifier for an SBT to be revoked
    function currentTokenId(address userAddress) external view returns (uint256) {
        return userCurrentTokenId[userAddress];
    }

}
