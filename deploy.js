// A simple ethers.js script to deploy the contract
const { ethers } = require("ethers");

async function main() {
    const provider = new ethers.JsonRpcProvider("YOUR_RPC_URL");
    const wallet = new ethers.Wallet("YOUR_PRIVATE_KEY", provider);
    
    console.log("Deploying contract with account:", wallet.address);

    // This is a placeholder for the compiled ABI and Bytecode
    const abi = [ /* ABI from Token.sol */ ];
    const bytecode = "0x..."; 

    const factory = new ethers.ContractFactory(abi, bytecode, wallet);
    const contract = await factory.deploy("MyToken", "MTK", 1000000);

    console.log("Token deployed to:", contract.target);
}

main().catch((error) => {
    console.error(error);
    process.exit(1);
});
