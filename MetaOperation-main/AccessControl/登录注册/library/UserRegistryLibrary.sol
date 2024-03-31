// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library UserRegistryLibrary {
    struct User {
        string username;
        string password;
    }
    
    struct UserRegistry {
        mapping(address => User) users;
    }
    
    function registerUser(UserRegistry storage self, string memory _username, string memory _password) internal {
        // 检查用户是否已经注册
        require(bytes(self.users[msg.sender].username).length == 0, "User already registered");

        // 创建新用户
        User memory newUser = User(_username, _password);

        // 将用户添加到映射中
        self.users[msg.sender] = newUser;
    }
    
    function loginUser(UserRegistry storage self, string memory _username, string memory _password) internal view returns (bool) {
        User memory user = self.users[msg.sender];

        // 检查用户名和密码是否匹配
        if (keccak256(bytes(user.username)) == keccak256(bytes(_username)) && keccak256(bytes(user.password)) == keccak256(bytes(_password))) {
            return true;
        } else {
            return false;
        }
    }
}
