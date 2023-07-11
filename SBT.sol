// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

import {ERC5192} from "./ERC5192.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SBT is ERC5192, Ownable {
    bool private locked;

    constructor(bool _isLocked) ERC5192("SwipeluxSBT", "SWP", _isLocked)
    {
        locked = _isLocked;
    }

    function safeMint(address to, uint256 tokenId) external onlyOwner {
        _safeMint(to, tokenId);
        if (locked) emit Locked(tokenId);
    }

}
