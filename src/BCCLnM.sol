// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {OwnerIsCreator} from "@chainlink/contracts-ccip/src/v0.8/shared/access/OwnerIsCreator.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BCCLnM is ERC20, OwnerIsCreator {

    constructor(address _airdrop) ERC20("Blockitus Cross Chain LnM", "BCCLnM") {
        _mint(_airdrop, 100 ether);
    }

    function mint(address beneficiary, uint256 amount) onlyOwner public {
        _mint(beneficiary, amount);
    }

}