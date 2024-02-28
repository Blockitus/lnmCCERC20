// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import {CCIPReceiver} from "@chainlink/contracts-ccip/src/v0.8/ccip/applications/CCIPReceiver.sol";
import {Client} from "@chainlink/contracts-ccip/src/v0.8/ccip/libraries/Client.sol";
import {ChainsListerOperator} from "./ChainsListerOperator.sol";

contract CCIPTokenAndDataReceiver is CCIPReceiver, ChainsListerOperator {
    uint256 price;

    event MintCallSuccessfull(bytes4 function_selector);

    constructor(address _router, uint256 _price) CCIPReceiver(_router) {
        price = _price;
    }

    function _ccipReceive(
        Client.Any2EVMMessage memory message
    ) 
        internal
        onlyWhitelistedChain(message.sourceChainSelector)
        onlyWhitelistedSenders(abi.decode(message.sender, (address))) 
        override 
    {   
        bytes memory dataToCall = message.data;
        
        emit MintCallSuccessfull(bytes4(dataToCall));
    }
}