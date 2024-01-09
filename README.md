# Build an NFT Collection with a whitelist

### Problem:

Launched an NFT Collection called "NFT" and added early supporters to a whitelist for guaranteed access to NFT minting during the project launch.

### Solution:

To achieve this, build a whitelist contract and invite early supporters to join. Being on the whitelist ensures them guaranteed access to mint the NFT once the collection is officially launched!

### Tools

For editing, compiling, debugging and deploying smart contracts we have used Hardhat.

- Basic JavaScript Project setup using Hardhat
  `npm install --save-dev hardhat @nomicfoundation/hardhat-toolbox`
  `npx hardhat`

- Deployment of Contract on Sepolia Network
  `npx hardhat run scripts/deploy.js --network sepolia`
