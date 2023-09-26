// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

import {ERC5192} from "./ERC5192.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import {VerifierSig} from "./Verifier.sol";

contract SBT is ERC5192, Ownable {
    bool private locked;
    uint256 private currentId;

    struct NFTMetadata {
        string name;
        string description;
        string image;
    }

    mapping(address => uint256) private userCurrentTokenId;
    VerifierSig public verifier;
    NFTMetadata public nftMetadata = NFTMetadata(
        "ZeroID",
        "Identity Passport",
        "https://ipfs.io/ipfs/QmQqzMTavQgT4f4T5v6PWBp7XNKtoPmC9jvn12WPT3gkSE"
    );

    constructor(address verifierAddress) ERC5192("Zero ID", "ZEROID", true) {
        locked = true;
        verifier = VerifierSig(verifierAddress);
        currentId = 0;
    }

    function safeMint(address targetAddress) external onlyOwner {
        require(
            userCurrentTokenId[targetAddress] == uint256(0),
            "user already has an SBT issued"
        );
        uint256 tokenId = ++currentId;
        _safeMint(targetAddress, tokenId);
        userCurrentTokenId[targetAddress] = tokenId;
        if (locked) emit Locked(tokenId);
    }

    /// @notice Revokes particular users' SBT making no longer accessible
    /// @dev Only contract owner (SBT issuer) can revoke SBTs
    /// @param userAddress The identifier for an SBT to be revoked
    function revoke(address userAddress) external onlyOwner {
        require(
            userCurrentTokenId[userAddress] != uint256(0),
            "SBT holder not found"
        );
        uint256 tokenId = userCurrentTokenId[userAddress];
        delete userCurrentTokenId[userAddress];
        _burn(tokenId);
    }

    function tokenURI(uint256 tokenID) public override view returns (string memory) {
        return "https://ipfs.io/ipfs/QmQqzMTavQgT4f4T5v6PWBp7XNKtoPmC9jvn12WPT3gkSE";
    }

    /// @notice Revokes particular SBT making no longer accessible by user
    /// @dev Only contract owner (SBT issuer) can revoke SBTs
    /// @dev Unlike single-address version the method is fail-safe by design
    /// @param userAddresses The addresses list for an SBTs to be revoked for
    function revokeAll(address[] memory userAddresses) external onlyOwner {
        for (uint256 i = 0; i < userAddresses.length; i++) {
            address userAddress = userAddresses[i];
            uint256 tokenId = userCurrentTokenId[userAddress];
            delete userCurrentTokenId[userAddress];
            _burn(tokenId);
        }
    }

    /// @notice Returns current user SBT id: there can be only one SBT per address at a time.
    /// @param userAddress The identifier for an SBT to be revoked
    function currentTokenId(address userAddress)
    external
    view
    returns (uint256)
    {
        return userCurrentTokenId[userAddress];
    }

    function verifyProof(
        uint[2] memory a,
        uint[2][2] memory b,
        uint[2] memory c,
        uint[11] memory input
    ) public view returns (bool) {
        return verifier.verifyProof(a, b, c, input);
    }

    function getNFTMetadata(uint256 tokenId) public view returns (NFTMetadata memory) {
        return nftMetadata;
    }
}
