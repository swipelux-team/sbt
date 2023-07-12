// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

import {ERC721Holder} from "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import "forge-std/Test.sol";

import {SBT} from "contracts/SBT.sol";

contract SBTTest is Test, ERC721Holder {
    SBT sbt;

    function setUp() public {
        sbt = new SBT(true);
    }

    function testCallingLocked() public {
        address to = address(this);
        uint256 tokenId = 0;
        sbt.safeMint(to, tokenId);
        assertTrue(sbt.locked(tokenId));
    }

    function testSupportsIERC5192() public {
        assertTrue(sbt.supportsInterface(type(IERC5192).interfaceId));
        assertTrue(unlockedToken.supportsInterface(type(IERC5192).interfaceId));
    }

    function testLockedErrorOnNonExistentTokenId() public {
        vm.expectRevert(ERC5192.ErrNotFound.selector);
        sbt.locked(1);
    }

    function testBlockedSetApprovalForAll() public {
        vm.expectRevert(ERC5192.ErrLocked.selector);
        sbt.setApprovalForAll(address(1), true);
    }

    function testBlockedSafeTransferFrom() public {
        address to = address(this);
        uint256 tokenId = 0;
        sbt.safeMint(to, tokenId);

        bytes memory data;
        vm.expectRevert(ERC5192.ErrLocked.selector);
        sbt.safeTransferFrom(address(this), address(1), tokenId, data);

        vm.expectRevert(ERC5192.ErrLocked.selector);
        sbt.safeTransferFrom(address(this), address(1), tokenId);
    }

    function testBlockedTransferFrom() public {
        address to = address(this);
        uint256 tokenId = 0;
        sbt.safeMint(to, tokenId);

        vm.expectRevert(ERC5192.ErrLocked.selector);
        sbt.transferFrom(address(this), address(1), tokenId);
    }

    function testBlockedApprove() public {
        address to = address(this);
        uint256 tokenId = 0;
        sbt.safeMint(to, tokenId);

        vm.expectRevert(ERC5192.ErrLocked.selector);
        sbt.approve(address(1), tokenId);
    }

    function testBlockedSetApprovalForAll() public {
        vm.expectRevert(ERC5192.ErrLocked.selector);
        sbt.setApprovalForAll(address(1), true);
    }
}
