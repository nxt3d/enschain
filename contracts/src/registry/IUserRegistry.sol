// SPDX-License-Identifier: MIT
pragma solidity >=0.8.13;

import {IERC1155Singleton} from "./IERC1155Singleton.sol";

interface IUserRegistry is IERC1155Singleton {
    function uri(uint256 id) external pure returns (string memory);
    function mint(
        string calldata _label,
        address owner,
        IRegistry registry,
        uint96 flags
    ) external;
    function burn(uint256 tokenId) external;
    function locked(uint256 tokenId) external view returns (bool);
    function lock(uint256 tokenId) external;
    function setSubregistry(uint256 tokenId, IRegistry registry) external;
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}