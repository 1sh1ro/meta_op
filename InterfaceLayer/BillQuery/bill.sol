// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title bill_interface
 * @author xulas
 */
interface bill {
    
    function queryBills(string calldata _holdrCmID) external returns(string[] memory);
    function queryBillByNo(string calldata _infoID) external returns(string memory);
    function queryWaitBills(string calldata _waitEndorseCmID) external returns(string[] memory);


}