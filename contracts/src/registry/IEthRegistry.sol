// SPDX-License-Identifier: MIT
pragma solidity >=0.8.13;

import {IRegistry} from "./IRegistry.sol";

interface IETHRegistry is IRegistry {
    function uri(uint256 tokenId) external pure returns (string memory);
    function ownerOf(uint256 tokenId) external view returns (address);
    function register(
        string calldata label,
        address owner,
        IRegistry registry,
        uint32 flags,
        uint64 expires
    ) external returns (uint256 tokenId);
    function renew(uint256 tokenId, uint64 expires) external;
    function nameData(uint256 tokenId) external view returns (uint64 expiry, uint32 flags);
    function lock(uint256 tokenId, uint32 flags) external;
    function setSubregistry(uint256 tokenId, IRegistry registry) external;
    function setResolver(uint256 tokenId, address resolver) external;
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
    function getSubregistry(string calldata label) external view returns (IRegistry);
    function getResolver(string calldata label) external view returns (address);
}
