const { ethers } = require('ethers');


const errorSignatures = 
[
"InsufficientBalance(uint256,uint256)",
"NothingToWithdraw()",
"InvalidReceiverAddress()",
"SenderNotWhitelisted()",
"SenderAlreadyListed()",
"DestinationChainNotWhitelisted(uint64)",
"DestinationChainAlreadyWhiteListed(uint64)",
"InsufficientFeeTokenAmount()",
"UnsupportedToken(IERC20)",
"UnsupportedDestinationChain(uint64)",
"InvalidMsgValue()",
"MessageGasLimitTooHigh()",
"InvalidExtraArgsTag()",
"SenderNotWhitelisted()"];

const errorIdentifiers = [];
for (let i = 0; i < errorSignatures.length; i++) {
    errorIdentifiers[i] = ethers.utils.id(errorSignatures[i]).slice(0, 10);
}


const error_taging = ethers.utils.id("SenderNotWhitelisted()").slice(0, 10);
console.log(error_taging);
console.log(errorIdentifiers);