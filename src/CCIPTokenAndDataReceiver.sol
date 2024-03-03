// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import {CCIPReceiver} from "@chainlink/contracts-ccip/src/v0.8/ccip/applications/CCIPReceiver.sol";
import {Client} from "@chainlink/contracts-ccip/src/v0.8/ccip/libraries/Client.sol";
import {ChainsListerOperator} from "./ChainsListerOperator.sol";
import {BCCLnM} from "./BCCLnM.sol";

contract CCIPTokenAndDataReceiver is CCIPReceiver, ChainsListerOperator {

    BCCLnM public bccLnM;

    event MintCallSuccessfull(bytes4 function_selector);

    constructor(address _router, address _airdrop) CCIPReceiver(_router) {
        bccLnM = new BCCLnM(_airdrop);
    }

    function _ccipReceive(
        Client.Any2EVMMessage memory message
    ) 
        internal
        onlyWhitelistedChain(message.sourceChainSelector)
        onlyWhitelistedSenders(abi.decode(message.sender, (address))) 
        override 
    {   
        bytes memory runMint = message.data;
        (bool success, ) = address(bccLnM).call(runMint); 
        require(success);
        emit MintCallSuccessfull(bytes4(runMint));
    }
}