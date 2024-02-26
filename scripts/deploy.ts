import { ethers } from "hardhat";

async function main() {

const token = await ethers.deployContract("WCXToken");

  await token.waitForDeployment();

  console.log(`Token deployed to ${token.target}`);

  const tokenBankFactory = await ethers.deployContract("TokenBankFactory");

  await tokenBankFactory.waitForDeployment();
  
  console.log(`TokenBankFactory deployed to ${tokenBankFactory.target}`);

  console.log("---------------------------------Create and Get Contract------------------")

  // const tokenBank = await ethers.getContractAt("ITokenBankFactory", token.target)

  const tx = await tokenBankFactory.createTokenBank(token.target);
  await tx.wait();
  
  const result = await tokenBankFactory.getTokenBanks()

  console.log(result)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

// Token deployed to 0xA405d54b7B63e12A60d1AD1724760683283220d5
// TokenBankFactory deployed to 0x81215Ff2b900461Bf7B731409cF65E3c57d0A6fA
// TokenBank : 0xDAC6046c5587Ca8E385b4cEd32f6A8c48f6284aa