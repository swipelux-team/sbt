# sbt-contracts
SBT-functionality related smart contracts

## IERC5192

### Contract
IERC5192 : contracts/IERC5192.sol

 --- 
### Functions:
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

 --- 
### Events:
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

