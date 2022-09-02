//SPDX-License-Identifier: UNLICENSED 
pragma solidity ^0.8.0;
import { IPool } from './ILendingPool.sol';
import { ILendingPoolAddressesProvider } from './ILendingPoolAddressesProvider.sol';

/**
* @title IFlashLoanReceiver interface
* @notice Interface for the Aave fee IFlashLoanReceiver.
* @author Aave
* @dev implement this interface to develop a flashloan-compatible flashLoanReceiver contract
**/
interface IFlashLoanReceiver {
    function executeOperation(
        address[] calldata assets, 
        uint256[] calldata amounts, 
        uint256[] calldata premiums,
        address initiator,
        bytes calldata params
    ) external returns (bool);

    function ADDRESSES_PROVIDER() external view returns (IPoolAddressesProvider);
    function POOL() external view returns (IPool);
}