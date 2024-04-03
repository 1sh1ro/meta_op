// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "../libraries/contractOwnershipCtrl.sol";

contract testContractCtrl is contractOwnshipCtrl {
    constructor() contractOwnshipCtrl() {

    }

}