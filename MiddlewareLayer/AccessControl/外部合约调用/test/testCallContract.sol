// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import { callContract } from "./libraries/callContract.sol";
import { deployedContract } from "./libraries/callContract.sol";


contract testCallContract {
    function get(deployedContract ad) public pure returns (uint) {
       return callContract.callfunc(ad);
    }
}