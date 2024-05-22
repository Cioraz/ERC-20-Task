// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SimpleDEX{
    address public owner;
    IERC20 public tokenA;
    IERC20 public tokenB;
    uint public exchangeRate;

}