# Deploying & updating codebase:

**IDE:  https://remix.ethereum.org for contracts.**

## Deploy/Setup contracts:

1. Deploy `SatToken.sol` using these parameters: `"splyt", "splyt token contract", 4`
2. Deploy `SplytTracker.sol` using these parameters: `4, "splyt", [SatToken contract address from step 1]`.
3. Call `SatToken.setTrackerAddr` function to set SplytTracker address: `[SplytTracker contract address from step 2]`

## Update ABI & contract addresses:
1. After deploying contracts from above update the necessary ABIs in `/controllers/ethereum.js` file.
2. Update the appropiate contract addresses as well.

---
##### Everything is setup at this point and you can push to server.


## Creating a Fractional listing:

1. Call `SplytTracker.createAsset` function to create an asset: `"0x5a396abf23663a0013fbb0b3", 1, "WEEK", "Coffee for sale", 350, 1621239891, "0x951d59b8Be3bfe2473572F04E3aFe315D48E2c3B", 4`
2. Call `SplytTracker.getAddressById` function to get asset's contract address from step 1: `"0x5a396abf23663a0013fbb0b3"`
3. Create an asset contract by using the returned address from step 2: `"0x30e03f3a791a981a6b471b9d6e2a332f9805e021"`

## Contributing to a Fractional Listing:

1. Call `Asset.contribute` function using these parameters: `"0xd9e5e4bde24faa2b277ab2be78c95b9ae24259a8", 4, "0x951d59b8be3bfe2473572f04e3afe315d48e2c3b", 30`