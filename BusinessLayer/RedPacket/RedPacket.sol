// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RedPacket {
    address public owner;
    mapping(address => uint256) public redPacketBalances;

    event RedPacketSent(address indexed receiver, uint256 amount);
    
    constructor() {
        owner = msg.sender;
    }

    function sendRedPacket(uint256 totalAmount, uint256 numRecipients) public payable {
        require(msg.sender == owner, "Only owner can send red packets");
        require(totalAmount >= numRecipients, "Total amount must be greater than or equal to the number of recipients");

        uint256 amountPerRecipient = totalAmount / numRecipients;
        
        for (uint256 i = 0; i < numRecipients; i++) {
            address receiver = address(uint160(uint(keccak256(abi.encodePacked(msg.sender, i)))));
            redPacketBalances[receiver] += amountPerRecipient;
            emit RedPacketSent(receiver, amountPerRecipient);
        }
    }

    function claimRedPacket() public {
        require(redPacketBalances[msg.sender] > 0, "No red packet to claim");
        
        uint256 amount = redPacketBalances[msg.sender];
        redPacketBalances[msg.sender] = 0;
        
        payable(msg.sender).transfer(amount);
    }
}
