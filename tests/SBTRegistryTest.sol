// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

import {ERC721Holder} from "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";

import {SBT} from "contracts/SBT.sol";
import {SBTRegistry} from "contracts/SBTRegistry.sol";

contract SBTRegistryTest {
    SBT private sbt;
    SBTRegistry private sbtRegistry;
    address private dAppAddress;

    constructor(address sbtAddress, address sbtRegistryAddress) {
        sbt = SBT(sbtAddress);
        sbtRegistry = SBTRegistry(sbtRegistryAddress);
        dAppAddress = address(0x943a73d843C033704002538D83Da4D9fF18B1Ef6);
    }

    function testPermissionGrant() public payable {
        uint256 tokenId = 1;
        uint256 level = 1;
        sbt.safeMint(sbt.owner(), tokenId);
        sbtRegistry.grantPermission(dAppAddress, level);

        assert(sbtRegistry.isAllowed(dAppAddress, sbt.owner(), 1));
    }

    function testPermissionRevoke() public payable {
        sbtRegistry.revokePermission(dAppAddress);
        assert(!sbtRegistry.isAllowed(dAppAddress, sbt.owner(), 0));
    }
}

