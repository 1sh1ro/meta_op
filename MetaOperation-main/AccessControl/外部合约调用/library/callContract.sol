// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface deployedContract {
    // 该接口需要根据实际所需要调用的合约进行更改。
        function getName() external pure returns (uint);
    }

library callContract {
    function callfunc (deployedContract dc) internal pure returns (uint) {
        // 改调用函数也需要根据实际进行更改。
       return dc.getName();
    }
}