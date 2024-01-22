// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;



import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "./IERC5192.sol";



contract ZEROID is IERC5192, ERC721Upgradeable, OwnableUpgradeable, UUPSUpgradeable {
    
    error ErrorLocked(string message);

    bool private isLocked;
    uint256 public currentId;
    mapping(address => uint256) private userTokenId;
    mapping(address => string) private dataprints;
    mapping(string => address[]) private dataprintAddresses;


    modifier checkLock() {
        if (isLocked) revert ErrorLocked("token is non-transferrable");
        _;
    }
    
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(address initialOwner) initializer public {
        __ERC721_init("Zero ID Passport", "ZEROID");
        __Ownable_init(initialOwner);
        __UUPSUpgradeable_init();
        isLocked = true;
    }

    function safeMint(address targetAddress) external onlyOwner {
        require(
            userTokenId[targetAddress] == uint256(0),
            "user already has an SBT issued"
        );
        uint256 tokenId = ++currentId;
        _safeMint(targetAddress, tokenId);
        userTokenId[targetAddress] = tokenId;
        emit Locked(tokenId);
    }


    function updateDataprint(
        address targetAddress, 
        string memory dataprint
    ) external onlyOwner {
        dataprints[targetAddress] = dataprint;
        dataprintAddresses[dataprint].push(targetAddress);
    }

    function dataprint(address targetAddress) 
    public 
    view 
    onlyOwner 
    returns(string memory) {
        return dataprints[targetAddress];
    }

    function relatedAddresses(string memory dataprint)
    public 
    view 
    onlyOwner
    returns(address[] memory) {
        return dataprintAddresses[dataprint];
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        onlyOwner
        override
    {}

    /// @dev All SBT are locked for transfer by default
    function locked(uint256 tokenId) external view returns (bool) {
        return isLocked;
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) public override checkLock {
        super.safeTransferFrom(from, to, tokenId, data);
    }

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public override checkLock {
        super.transferFrom(from, to, tokenId);
    }

    function approve(address approved, uint256 tokenId)
        public
        override
        checkLock
    {
        super.approve(approved, tokenId);
    }

    function setApprovalForAll(address operator, bool approved)
        public
        override
        checkLock
    {
        super.setApprovalForAll(operator, approved);
    }

    /// @notice Revokes particular SBT making no longer accessible by user
    /// @dev Only contract owner (SBT issuer) can revoke SBTs
    /// @dev Unlike single-address version the method is fail-safe by design
    /// @param userAddresses The addresses list for an SBTs to be revoked for
    function revokeAll(address[] memory userAddresses) external onlyOwner {
        for (uint256 i = 0; i < userAddresses.length; i++) {
            address userAddress = userAddresses[i];
            uint256 tokenId = userTokenId[userAddress];
            delete userTokenId[userAddress];
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
        return userTokenId[userAddress];
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override
        returns (bool)
    {
        return
            interfaceId == type(IERC5192).interfaceId ||
            super.supportsInterface(interfaceId);
    }

}
