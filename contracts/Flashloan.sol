//SPDX-License-Identifier:UNLICENSED 
pragma solidity ^0.8.0;

import "./FlashLoanRecieverBase.sol";
import "./interfaces/ILendingPoolAddressesProvider.sol";
import "./interfaces/ILendingPool.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


/**
 * @title Flashloaon contract 
 * @notice Implements a flashloan contract 
 */
contract Flashloan is FlashLoanReceiverBase, Ownable {

    constructor(address _addressProvider) FlashLoanReceiverBase(ILendingPoolAddressesProvider(_addressProvider)) public {}

    /**
        @dev This function is called after your contract has received the flash loaned amount
     */
    function executeOperation(
        address[] calldata assets, 
        uint256[] calldata amounts, 
        uint256[] calldata premiums,
        address initiator,
        bytes calldata params
    )
        external
        override 
        returns(bool)
    {
        //require(_amount <= getBalanceInternal(address(this), _reserve),"Blablabla");
        // Your logic goes here.
        // !! Ensure that *this contract* has enough of `_reserve` funds to payback the `_fee` !
    }

    function flashloan(address[] calldata assets, uint256[] calldata amounts, uint256[] calldata interestRateModes, uint16 referralCode) public onlyOwner {
        bytes memory params = "";
        POOL.flashLoan(address(this), assets, amounts, interestRateModes, msg.sender, params, referralCode);
    }
}