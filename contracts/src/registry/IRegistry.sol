// SPDX-License-Identifier: MIT
pragma solidity >=0.8.13;

import {IERC1155Singleton} from "./IERC1155Singleton.sol";

interface IRegistry is IERC1155Singleton {
    event RegistryChanged(string label, IRegistry registry);
    event ResolverChanged(address resolver);

    /**
     * @dev Fetches the registry for a subdomain of the current registry.
     *      Most resolvers will only need to consult the one label starting at `index`; the
     *      full name is provided for the convenience of registries that need to modify
     *      their behaviour based on what name they were located for.
     * @param name The DNS-encoded name being resolved.
     * @return The address of the registry for this subdomain, or `address(0)` if none exists.
     */
    function getSubregistry(bytes calldata name) external view returns (IRegistry);

    /**
     * @dev Fetches the resolver responsible for the current name.
     *      This returns the resolver for the name(s) the registry is responsible for,
     *      not the resolver ultimately responsible for `name`. In most implementations,
     *      `name` can be ignored and the same resolver returned for all calls; `name`
     *      is supplied for the convenience of registries that handle multiple names.
     * @param name The DNS-encoded name being resolved.
     * @return The address of a resolver responsible for this name, or `address(0)` if none exists.
     */
    function getResolver(bytes calldata name) external view returns (address);
}
