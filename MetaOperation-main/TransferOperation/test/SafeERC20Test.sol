// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.6.0;

import {TransferHelper} from "./SafeERC20.sol";

contract Test{

    address token;
    address from;
    address to;
    uint256 value;

    constructor(address token1,
        address from1,
        address to1,
        uint256 value1){
        token = token1;
        from = from1;
        to = to1;
        value = value1;
    }

    function safeTransferFromTest() public {
        TransferHelper.safeTransferFrom(token,from,to,value);
    }

    function safeTransferTest() public {
        TransferHelper.safeTransfer(token,to,value);
    }

    function safeApproveTest() public {
        TransferHelper.safeApprove(token,to,value);   
    }

    function safeTransferETHTest() public {
        TransferHelper.safeTransferETH(to,value);  
    }
}