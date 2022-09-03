import { ethers } from "hardhat";

async function main() {
  const Flashloan = await ethers.getContractFactory("Flashloan");
  const flashloan = await Flashloan.deploy();
  await flashloan.deployed();
  console.log(flashloan.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
