# sbt-contracts
SBT-functionality related smart contracts

## SBT

### Contract
SBT : contracts/SBT.sol

 --- 
### Functions:
### constructor

```solidity
constructor(bool _isLocked) public
```

### safeMint

```solidity
function safeMint(address to, uint256 tokenId) external
```

Mints SBT to an address

_Only contract owner (SBT issuer) can mint SBTs_

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| to | address | The SBT reciever address. |
| tokenId | uint256 | The identifier for an SBT. |

### revoke

```solidity
function revoke(uint256 tokenId) external
```

Revokes particular SBT making no longer accessible by user

_Only contract owner (SBT issuer) can revoke SBTs_

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| tokenId | uint256 | The identifier for an SBT to be revoked |

### currentTokenId

```solidity
function currentTokenId(address userAddress) external view returns (uint256)
```

Returns current user SBT id: there can be only one SBT per address at a time.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| userAddress | address | The identifier for an SBT to be revoked |

inherits Ownable:
### owner

```solidity
function owner() public view virtual returns (address)
```

_Returns the address of the current owner._

### _checkOwner

```solidity
function _checkOwner() internal view virtual
```

_Throws if the sender is not the owner._

### renounceOwnership

```solidity
function renounceOwnership() public virtual
```

_Leaves the contract without owner. It will not be possible to call
`onlyOwner` functions. Can only be called by the current owner.

NOTE: Renouncing ownership will leave the contract without an owner,
thereby disabling any functionality that is only available to the owner._

### transferOwnership

```solidity
function transferOwnership(address newOwner) public virtual
```

_Transfers ownership of the contract to a new account (`newOwner`).
Can only be called by the current owner._

### _transferOwnership

```solidity
function _transferOwnership(address newOwner) internal virtual
```

_Transfers ownership of the contract to a new account (`newOwner`).
Internal function without access restriction._

inherits ERC5192:
### locked

```solidity
function locked(uint256 tokenId) external view returns (bool)
```

Returns the locking status of an Soulbound Token

_SBTs assigned to zero address are considered invalid, and queries
about them do throw._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| tokenId | uint256 | The identifier for an SBT. |

### safeTransferFrom

```solidity
function safeTransferFrom(address from, address to, uint256 tokenId, bytes data) public
```

_See {IERC721-safeTransferFrom}._

### safeTransferFrom

```solidity
function safeTransferFrom(address from, address to, uint256 tokenId) public
```

_See {IERC721-safeTransferFrom}._

### transferFrom

```solidity
function transferFrom(address from, address to, uint256 tokenId) public
```

_See {IERC721-transferFrom}._

### approve

```solidity
function approve(address approved, uint256 tokenId) public
```

### setApprovalForAll

```solidity
function setApprovalForAll(address operator, bool approved) public
```

_See {IERC721-setApprovalForAll}._

### supportsInterface

```solidity
function supportsInterface(bytes4 interfaceId) public view virtual returns (bool)
```

_See {IERC165-supportsInterface}._

inherits IERC5192:
inherits ERC721:
### balanceOf

```solidity
function balanceOf(address owner) public view virtual returns (uint256)
```

_See {IERC721-balanceOf}._

### ownerOf

```solidity
function ownerOf(uint256 tokenId) public view virtual returns (address)
```

_See {IERC721-ownerOf}._

### name

```solidity
function name() public view virtual returns (string)
```

_See {IERC721Metadata-name}._

### symbol

```solidity
function symbol() public view virtual returns (string)
```

_See {IERC721Metadata-symbol}._

### tokenURI

```solidity
function tokenURI(uint256 tokenId) public view virtual returns (string)
```

_See {IERC721Metadata-tokenURI}._

### _baseURI

```solidity
function _baseURI() internal view virtual returns (string)
```

_Base URI for computing {tokenURI}. If set, the resulting URI for each
token will be the concatenation of the `baseURI` and the `tokenId`. Empty
by default, can be overridden in child contracts._

### getApproved

```solidity
function getApproved(uint256 tokenId) public view virtual returns (address)
```

_See {IERC721-getApproved}._

### isApprovedForAll

```solidity
function isApprovedForAll(address owner, address operator) public view virtual returns (bool)
```

_See {IERC721-isApprovedForAll}._

### _safeTransfer

```solidity
function _safeTransfer(address from, address to, uint256 tokenId, bytes data) internal virtual
```

_Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
are aware of the ERC721 protocol to prevent tokens from being forever locked.

`data` is additional data, it has no specified format and it is sent in call to `to`.

This internal function is equivalent to {safeTransferFrom}, and can be used to e.g.
implement alternative mechanisms to perform token transfer, such as signature-based.

Requirements:

- `from` cannot be the zero address.
- `to` cannot be the zero address.
- `tokenId` token must exist and be owned by `from`.
- If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.

Emits a {Transfer} event._

### _ownerOf

```solidity
function _ownerOf(uint256 tokenId) internal view virtual returns (address)
```

_Returns the owner of the `tokenId`. Does NOT revert if token doesn't exist_

### _exists

```solidity
function _exists(uint256 tokenId) internal view virtual returns (bool)
```

_Returns whether `tokenId` exists.

Tokens can be managed by their owner or approved accounts via {approve} or {setApprovalForAll}.

Tokens start existing when they are minted (`_mint`),
and stop existing when they are burned (`_burn`)._

### _isApprovedOrOwner

```solidity
function _isApprovedOrOwner(address spender, uint256 tokenId) internal view virtual returns (bool)
```

_Returns whether `spender` is allowed to manage `tokenId`.

Requirements:

- `tokenId` must exist._

### _safeMint

```solidity
function _safeMint(address to, uint256 tokenId) internal virtual
```

_Safely mints `tokenId` and transfers it to `to`.

Requirements:

- `tokenId` must not exist.
- If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.

Emits a {Transfer} event._

### _safeMint

```solidity
function _safeMint(address to, uint256 tokenId, bytes data) internal virtual
```

_Same as {xref-ERC721-_safeMint-address-uint256-}[`_safeMint`], with an additional `data` parameter which is
forwarded in {IERC721Receiver-onERC721Received} to contract recipients._

### _mint

```solidity
function _mint(address to, uint256 tokenId) internal virtual
```

_Mints `tokenId` and transfers it to `to`.

WARNING: Usage of this method is discouraged, use {_safeMint} whenever possible

Requirements:

- `tokenId` must not exist.
- `to` cannot be the zero address.

Emits a {Transfer} event._

### _burn

```solidity
function _burn(uint256 tokenId) internal virtual
```

_Destroys `tokenId`.
The approval is cleared when the token is burned.
This is an internal function that does not check if the sender is authorized to operate on the token.

Requirements:

- `tokenId` must exist.

Emits a {Transfer} event._

### _transfer

```solidity
function _transfer(address from, address to, uint256 tokenId) internal virtual
```

_Transfers `tokenId` from `from` to `to`.
 As opposed to {transferFrom}, this imposes no restrictions on msg.sender.

Requirements:

- `to` cannot be the zero address.
- `tokenId` token must be owned by `from`.

Emits a {Transfer} event._

### _approve

```solidity
function _approve(address to, uint256 tokenId) internal virtual
```

_Approve `to` to operate on `tokenId`

Emits an {Approval} event._

### _setApprovalForAll

```solidity
function _setApprovalForAll(address owner, address operator, bool approved) internal virtual
```

_Approve `operator` to operate on all of `owner` tokens

Emits an {ApprovalForAll} event._

### _requireMinted

```solidity
function _requireMinted(uint256 tokenId) internal view virtual
```

_Reverts if the `tokenId` has not been minted yet._

### _beforeTokenTransfer

```solidity
function _beforeTokenTransfer(address from, address to, uint256 firstTokenId, uint256 batchSize) internal virtual
```

_Hook that is called before any token transfer. This includes minting and burning. If {ERC721Consecutive} is
used, the hook may be called as part of a consecutive (batch) mint, as indicated by `batchSize` greater than 1.

Calling conditions:

- When `from` and `to` are both non-zero, ``from``'s tokens will be transferred to `to`.
- When `from` is zero, the tokens will be minted for `to`.
- When `to` is zero, ``from``'s tokens will be burned.
- `from` and `to` are never both zero.
- `batchSize` is non-zero.

To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks]._

### _afterTokenTransfer

```solidity
function _afterTokenTransfer(address from, address to, uint256 firstTokenId, uint256 batchSize) internal virtual
```

_Hook that is called after any token transfer. This includes minting and burning. If {ERC721Consecutive} is
used, the hook may be called as part of a consecutive (batch) mint, as indicated by `batchSize` greater than 1.

Calling conditions:

- When `from` and `to` are both non-zero, ``from``'s tokens were transferred to `to`.
- When `from` is zero, the tokens were minted for `to`.
- When `to` is zero, ``from``'s tokens were burned.
- `from` and `to` are never both zero.
- `batchSize` is non-zero.

To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks]._

### __unsafe_increaseBalance

```solidity
function __unsafe_increaseBalance(address account, uint256 amount) internal
```

_Unsafe write access to the balances, used by extensions that "mint" tokens using an {ownerOf} override.

WARNING: Anyone calling this MUST ensure that the balances remain consistent with the ownership. The invariant
being that for any address `a` the value returned by `balanceOf(a)` must be equal to the number of tokens such
that `ownerOf(tokenId)` is `a`._

inherits IERC721Metadata:
inherits IERC721:
inherits ERC165:
inherits IERC165:

 --- 
### Events:
inherits Ownable:
### OwnershipTransferred

```solidity
event OwnershipTransferred(address previousOwner, address newOwner)
```

inherits ERC5192:
inherits IERC5192:
### Locked

```solidity
event Locked(uint256 tokenId)
```

Emitted when the locking status is changed to locked.

_If a token is minted and the status is locked, this event should be emitted._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| tokenId | uint256 | The identifier for a token. |

### Unlocked

```solidity
event Unlocked(uint256 tokenId)
```

Emitted when the locking status is changed to unlocked.

_If a token is minted and the status is unlocked, this event should be emitted._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| tokenId | uint256 | The identifier for a token. |

inherits ERC721:
inherits IERC721Metadata:
inherits IERC721:
### Transfer

```solidity
event Transfer(address from, address to, uint256 tokenId)
```

_Emitted when `tokenId` token is transferred from `from` to `to`._

### Approval

```solidity
event Approval(address owner, address approved, uint256 tokenId)
```

_Emitted when `owner` enables `approved` to manage the `tokenId` token._

### ApprovalForAll

```solidity
event ApprovalForAll(address owner, address operator, bool approved)
```

_Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets._

inherits ERC165:
inherits IERC165:

## SBTRegistry

### Contract
SBTRegistry : contracts/SBTRegistry.sol

 --- 
### Modifiers:
### hasSBT

```solidity
modifier hasSBT()
```

 --- 
### Functions:
### constructor

```solidity
constructor(address sbtContractAddress) public
```

### grantPermission

```solidity
function grantPermission(address dAppAddress, uint256 level) external
```

Grants permission for a dApp to retrieve user data

_User must have an SBT issued and grants permission by himself_

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| dAppAddress | address | the dApp address permission to be granted to |
| level | uint256 | user data disclosure level |

### revokePermission

```solidity
function revokePermission(address dAppAddress) external
```

Revokes permission for a dApp to retrieve user data

_User must have an SBT issued and grants permission by himself_

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| dAppAddress | address | the dApp address permission to be revoked from |

### isAllowed

```solidity
function isAllowed(address dAppAddress, address userAddress, uint256 level) external view returns (bool)
```

Returns allowance for a dApp to retrieve user data of specific level

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| dAppAddress | address | the dApp address permission to be checked for |
| userAddress | address | the user address permission to be revoked for |
| level | uint256 | disclosure level to be check for |

### currentTokenId

```solidity
function currentTokenId() internal view returns (uint256)
```

inherits OwnableUpgradeable:
### __Ownable_init

```solidity
function __Ownable_init() internal
```

_Initializes the contract setting the deployer as the initial owner._

### __Ownable_init_unchained

```solidity
function __Ownable_init_unchained() internal
```

### owner

```solidity
function owner() public view virtual returns (address)
```

_Returns the address of the current owner._

### _checkOwner

```solidity
function _checkOwner() internal view virtual
```

_Throws if the sender is not the owner._

### renounceOwnership

```solidity
function renounceOwnership() public virtual
```

_Leaves the contract without owner. It will not be possible to call
`onlyOwner` functions. Can only be called by the current owner.

NOTE: Renouncing ownership will leave the contract without an owner,
thereby disabling any functionality that is only available to the owner._

### transferOwnership

```solidity
function transferOwnership(address newOwner) public virtual
```

_Transfers ownership of the contract to a new account (`newOwner`).
Can only be called by the current owner._

### _transferOwnership

```solidity
function _transferOwnership(address newOwner) internal virtual
```

_Transfers ownership of the contract to a new account (`newOwner`).
Internal function without access restriction._

inherits ContextUpgradeable:
### __Context_init

```solidity
function __Context_init() internal
```

### __Context_init_unchained

```solidity
function __Context_init_unchained() internal
```

### _msgSender

```solidity
function _msgSender() internal view virtual returns (address)
```

### _msgData

```solidity
function _msgData() internal view virtual returns (bytes)
```

inherits Initializable:
### _disableInitializers

```solidity
function _disableInitializers() internal virtual
```

_Locks the contract, preventing any future reinitialization. This cannot be part of an initializer call.
Calling this in the constructor of a contract will prevent that contract from being initialized or reinitialized
to any version. It is recommended to use this to lock implementation contracts that are designed to be called
through proxies.

Emits an {Initialized} event the first time it is successfully executed._

### _getInitializedVersion

```solidity
function _getInitializedVersion() internal view returns (uint8)
```

_Returns the highest version that has been initialized. See {reinitializer}._

### _isInitializing

```solidity
function _isInitializing() internal view returns (bool)
```

_Returns `true` if the contract is currently initializing. See {onlyInitializing}._

 --- 
### Events:
### DappPemissionRevoked

```solidity
event DappPemissionRevoked(address user, uint256 tokenId, address dAppAddress)
```

### DappPemissionGranted

```solidity
event DappPemissionGranted(address user, uint256 tokenId, address dAppAddress, uint256 level)
```

inherits OwnableUpgradeable:
### OwnershipTransferred

```solidity
event OwnershipTransferred(address previousOwner, address newOwner)
```

inherits ContextUpgradeable:
inherits Initializable:
### Initialized

```solidity
event Initialized(uint8 version)
```

_Triggered when the contract has been initialized or reinitialized._
