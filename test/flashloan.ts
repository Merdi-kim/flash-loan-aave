import { time, loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Flashloan", function () {
  async function deployFlashLoanContrac() {
    const [owner, _] = await ethers.getSigners();
    const FlashLoan = await ethers.getContractFactory("Flashloan");
    const flashloan = await FlashLoan.deploy();
    await flashloan.deployed() 
    return flashloan 
  }

  describe("Funds request", async function () {
    const flashloanContract = await deployFlashLoanContrac();
    it("Should check that contract has been deployed", async function () {
      expect(flashloanContract.address).not.equal('0x0')
    });

    it("Should get funds for the future flashloan", async function () {
      const assets = ['']
      const amounts = [ethers.utils.parseEther('5')]
      const interestRateModes = [0]
      const referralCode = 0
      await flashloanContract.flashloan(assets, amounts, interestRateModes, referralCode)
      expect(flashloanContract.address).to.equal(amounts[0])
    });
  })

});
