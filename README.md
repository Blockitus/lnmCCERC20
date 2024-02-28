# LnM Custom Cross-Chain ERC20 TOKEN

Prepare

SOURCE CHAIN

1. Deploy CCIPCustomTokenSender at Mumbai
   1. ROUTER_ADDRESS: `0x0BF3dE8c5D3e8A2B34D2BEeB17ABfCeBaf363A59`
   2. LINKTOKEN_ADDRESS: `0x779877A7B0D9E8603169DdbD7836e478b4624789`
2. Whitelist the destination-chain-selector calling the `whitelistChain(uint64)` function
   1. fuji-chain-selector: 14767482510784806043
3. Fund CCIPCustomTokenSender with 1 Link token and 1000 BCC-LnM token.\
4. Run `transferTokensPayLinkToken(uint64,address,address,address,uint256)`

DESTINATION CHAIN