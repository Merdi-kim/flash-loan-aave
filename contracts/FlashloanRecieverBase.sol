// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.0;

import { IFlashLoanReceiver } from './interfaces/IFlashLoanReciever.sol';
import { ILendingPoolAddressesProvider } from './interfaces/ILendingPoolAddressesProvider.sol';
import { IPool } from './interfaces/ILendingPool.sol';

/**
 * @title FlashLoanReceiverBase
 * @author Aave
 * @notice Base contract to develop a flashloan-receiver contract.
 */
abstract contract FlashLoanReceiverBase is IFlashLoanReceiver {
  ILendingPoolAddressesProvider public immutable ADDRESSES_PROVIDER;
  IPool public immutable POOL;

  constructor(ILendingPoolAddressesProvider provider) {
    ADDRESSES_PROVIDER = provider;
    POOL = IPool(provider.getPool());
  }
}