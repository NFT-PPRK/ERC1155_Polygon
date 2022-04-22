const { task } = require("hardhat/config");
const { getContract } = require("./helpers");
const fetch = require("node-fetch");

<<<<<<< HEAD
// task("quantity", "Token quantity")
// .addParam("address", "The address to check token quantity")
// .setAction(async function(taskArguments, hre) {
//     const contract = await getContract("NFT", hre);
//     const transactionResponse = await contract.totalSupply(taskArguments.address);
//     console.log(`Address Token Quantity:${transactionResponse}`)
// })

=======
>>>>>>> 2818b682c3fcbf89c35d9c572bcdcd6ecfe2d8f5
task("mint", "Mints from the NFT contract")
.addParam("address", "The address to receive a token")
.setAction(async function (taskArguments, hre) {
    const contract = await getContract("NFT", hre);
<<<<<<< HEAD
    // const transactionResponse = await contract.mintTo(taskArguments.address, {
    //     gasLimit: 500_000,
    // });
    const transactionResponse = await contract.mintTo(taskArguments.address);
    console.log(`Transaction Hash: ${JSON.stringify(transactionResponse)}`);
=======
    const transactionResponse = await contract.mintTo(taskArguments.address, {
        gasLimit: 500_000,
    });
    console.log(`Transaction Hash: ${transactionResponse.hash}`);
>>>>>>> 2818b682c3fcbf89c35d9c572bcdcd6ecfe2d8f5
});

task("set-base-token-uri", "Sets the base token URI for the deployed smart contract")
.addParam("baseUrl", "The base of the tokenURI endpoint to set")
.setAction(async function (taskArguments, hre) {
    const contract = await getContract("NFT", hre);
    const transactionResponse = await contract.setBaseTokenURI(taskArguments.baseUrl, {
        gasLimit: 500_000,
    });
    console.log(`Transaction Hash: ${transactionResponse.hash}`);
});


task("token-uri", "Fetches the token metadata for the given token ID")
.addParam("tokenId", "The tokenID to fetch metadata for")
.setAction(async function (taskArguments, hre) {
    const contract = await getContract("NFT", hre);
    const response = await contract.tokenUri(taskArguments.tokenId, {
        gasLimit: 500_000,
    });
    
    const metadata_url = response;
    console.log(`Metadata URL: ${metadata_url}`);

    const metadata = await fetch(metadata_url).then(res => res.json());
    console.log(`Metadata fetch response: ${JSON.stringify(metadata, null, 2)}`);
<<<<<<< HEAD
});
=======
});
>>>>>>> 2818b682c3fcbf89c35d9c572bcdcd6ecfe2d8f5
