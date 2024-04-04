// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library AddressRegistry {
    struct Data {
        mapping(address => bool) allowedAddresses;
    }

    event AddressAdded(address indexed _address);
    event AddressRemoved(address indexed _address);

    modifier onlyOwner() {
        // 添加适当的所有者验证逻辑
        _;
    }

    function addAddress(Data storage self, address _address) internal onlyOwner {
        self.allowedAddresses[_address] = true;
        emit AddressAdded(_address);
    }
    
    function removeAddress(Data storage self, address _address) internal onlyOwner {
        self.allowedAddresses[_address] = false;
        emit AddressRemoved(_address);
    }
    
    function isAddressAllowed(Data storage self, address _address) internal view returns (bool) {
        return self.allowedAddresses[_address];
    }
}
