// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import { IdentityManger } from "../libraries/identityManagement.sol";

contract testIdentityMan {
    IdentityManger.Role private consumers;

    function addAddress(address account) public {
        IdentityManger.add(consumers, account);
    }

    function removeAddress(address account) public {
        IdentityManger.remove(consumers, account);
    }

    function checkExist(address account) public view returns (bool) {
        return IdentityManger.has(consumers, account);
    }
}