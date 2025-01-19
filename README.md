# Mood NFT Smart Contract

## Overview

Mood NFT is a smart contract built with Solidity that allows users to mint NFTs that reflect their mood. Each NFT can have one of two moods: `HAPPY` or `SAD`. The contract uses SVG images to visually represent these moods. Owners of the NFTs can flip the mood of their tokens between `HAPPY` and `SAD`.

This project demonstrates the use of:
- ERC721 standard for NFTs.
- Chainlink VRF for testing randomness (if applicable).
- Smart contract testing using Foundry.

---

## Features

- **Mint NFTs**: Users can mint new Mood NFTs.
- **Mood Flipping**: NFT owners can flip the mood of their NFTs between `HAPPY` and `SAD`.
- **Dynamic Metadata**: The `tokenURI` function generates metadata dynamically based on the NFT's mood.
- **Gas Optimization**: Efficient use of state variables and mappings.

---

## Smart Contract

The smart contract includes the following key components:

### State Variables
- `s_tokenCounter`: Keeps track of the total number of NFTs minted.
- `s_sadSvgImageUri`: Stores the URI of the `SAD` SVG image.
- `s_happySvgImageUri`: Stores the URI of the `HAPPY` SVG image.
- `s_tokenIdMood`: A mapping that links each token ID to its current mood.

### Enum
- `Mood`: Represents the possible moods (`HAPPY` or `SAD`).

### Constructor
The constructor initializes the contract with:
- SVG URIs for the `HAPPY` and `SAD` images.
- The ERC721 token name (`Mood NFT`) and symbol (`MN`).

### Functions

#### Public Functions
1. **`mintNft()`**
   - Mints a new NFT for the caller.
   - Sets the initial mood to `HAPPY`.

2. **`flipMood(uint256 tokenId)`**
   - Allows the NFT owner to change the mood of the token.
   - Reverts if the caller is not the token owner or approved.

#### View/Pure Functions
1. **`tokenURI(uint256 tokenId)`**
   - Returns the metadata for a given token ID.
   - The metadata includes the NFT name, description, attributes, and the image URI based on the token’s mood.

2. **`_baseURI()`**
   - Sets the base URI for metadata to `data:application/json;base64,`.

---

## Contract Testing

Testing was done using Foundry. Key tests include:
- **Minting**: Ensures NFTs can be minted and assigned unique IDs.
- **Mood Flipping**: Verifies that only the owner can flip the mood.
- **Token URI**: Checks that the metadata reflects the correct mood.

### Example Test
```solidity
function testViewTokenUriIntegration() public {
    vm.startPrank(USER);
    moodNft.mintNft();
    vm.stopPrank();

    console.log(moodNft.tokenURI(0));
}
```

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/mood-nft.git
   ```

2. Install dependencies:
   ```bash
   forge install
   ```

3. Compile the smart contracts:
   ```bash
   forge build
   ```

4. Run tests:
   ```bash
   forge test
   ```

---

## Deployment

To deploy the contract, use the following steps:

1. Update the constructor arguments in the `MoodNft` contract with your SVG URIs.
2. Deploy the contract using Foundry:
   ```bash
   forge create --rpc-url <RPC_URL> --private-key <PRIVATE_KEY> src/MoodNft.sol:MoodNft
   ```

---

## Example Interaction

### Minting an NFT
```bash
cast send 0xYourContractAddress "mintNft()" --rpc-url http://localhost:8545 --private-key <PRIVATE_KEY>
```

### Flipping the Mood
```bash
cast send 0xYourContractAddress "flipMood(uint256)" 0 --rpc-url http://localhost:8545 --private-key <PRIVATE_KEY>
```

### Viewing Metadata
```bash
cast call 0xYourContractAddress "tokenURI(uint256)" 0 --rpc-url http://localhost:8545
```

---

## License

This project is licensed under the MIT License.

---

## Acknowledgements

Special thanks to:
- [OpenZeppelin](https://openzeppelin.com/) for the ERC721 implementation.
- [Foundry](https://getfoundry.sh/) for testing and deployment tools.
- [Chainlink](https://chain.link/) for randomness and decentralized infrastructure.
- [X](https://x.com/theblack_2ke) My X account.

Feel free to contribute or suggest improvements!

