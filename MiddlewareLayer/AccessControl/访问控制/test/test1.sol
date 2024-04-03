// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "../contracts/AddressRegistry.sol";

contract MyContract {
    using AddressRegistry for AddressRegistry.Data;

    AddressRegistry.Data private addressRegistry;

    function addAddress(address _address) public {
        addressRegistry.addAddress(_address);
    }
    function removeAddress(address _address) public {
        addressRegistry.removeAddress(_address);
    }
    function isAddressAllowed(address _address) public view returns (bool) {
        bool isAllowed = addressRegistry.isAddressAllowed(_address);
        return isAllowed;
    }
}
