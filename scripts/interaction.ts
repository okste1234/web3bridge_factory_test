import { ethers } from "hardhat";

async function main() {
    const WCXTokenAddress = "0xA405d54b7B63e12A60d1AD1724760683283220d5" 
    
    const tokenBankAddress = "0xDAC6046c5587Ca8E385b4cEd32f6A8c48f6284aa"
    
    const tokenBank = await ethers.getContractAt("ITokenBank", tokenBankAddress);

    const WCXToken = await ethers.getContractAt("IWCXToken", WCXTokenAddress);

    const approval = await WCXToken.approve(tokenBankAddress, 5000)
    await approval.wait();
    0xbd58ca47c469352bea1a870f6a90c9292f9941dbe58b5b92e31d2f4b0aae640b

    const tx = await tokenBank.deposit(5000);
    await tx.wait();

    console.log(tx)


    // TX HASH = 0xbd58ca47c469352bea1a870f6a90c9292f9941dbe58b5b92e31d2f4b0aae640b
    

}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
