// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "../contracts/UserRegistryLibrary.sol";

contract UserRegistryContract {
    using UserRegistryLibrary for UserRegistryLibrary.UserRegistry;
    
    UserRegistryLibrary.UserRegistry private userRegistry;
    
    function register(string memory _username, string memory _password) public {
        userRegistry.registerUser(_username, _password);
    }
    
    function login(string memory _username, string memory _password) public view returns (bool) {
        return userRegistry.loginUser(_username, _password);
    }
}
