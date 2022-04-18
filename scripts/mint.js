const { task } = require("hardhat/config");
const { getContract } = require("./helpers");
const fetch = require("node-fetch");

task("mint", "Mints from the NFT contract")
.addParam("address", "The address to receive a token")
.setAction(async function (taskArguments, hre) {
    const contract = await getContract("NFT", hre);
    const transactionResponse = await contract.mintTo(taskArguments.address, {
        gasLimit: 500_000,
    });
    console.log(`Transaction Hash: ${transactionResponse.hash}`);
});

task("set-base-token-uri", "Sets the base token URI for the deployed smart contract")
.addParam("baseUrl", "The base of the tokenURI endpoint to set")
.setAction(async function (taskArguments, hre) {
    const contract = await getContract("NFT", hre);
    const transactionResponse = await contract.setBaseTokenURI(taskArguments.baseUrl, {
        // GasLimit은 사용할 가스에 대한 예측치 
        // GasLimit이 높다면 좋지만 자원상의 이유, Etherium 환경으로 인해서 적당하게 사용
        // Gas가 필요한 이유는 EVM상에서 트랜잭션을 동작시키기 위해 소모되는 비용
        // Gas Price : Gas Limit에서 1Gas 당 가격으로 높을수록 빠르게 실행된다.

        gasLimit: 500_000,
    });
    console.log(`Transaction Hash: ${transactionResponse.hash}`);
});


task("token-uri", "Fetches the token metadata for the given token ID")
.addParam("tokenId", "The tokenID to fetch metadata for")
.setAction(async function (taskArguments, hre) {
    const contract = await getContract("NFT", hre);
    const response = await contract.tokenURI(taskArguments.tokenId, {
        gasLimit: 500_000,
    });
    
    const metadata_url = response;
    console.log(`Metadata URL: ${metadata_url}`);

    const metadata = await fetch(metadata_url).then(res => res.json());
    console.log(`Metadata fetch response: ${JSON.stringify(metadata, null, 2)}`);
});