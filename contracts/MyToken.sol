// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SimpleDEX{
    address public owner;
    IERC20 public tokenA;
    IERC20 public tokenB;
    uint public exchangeRate;

    modifier onlyOwner(){
        require(msg.sender==owner,"Error: Not Authorised!");
        _;
    }

    constructor(address _tokenA,address _tokenB, uint _exchangeRate){
        owner=msg.sender;
        tokenA=IERC20(_tokenA);
        tokenB=IERC20(_tokenB);
        exchangeRate=_exchangeRate;
    }

    function setExchangeRate(uint _newRate) public onlyOwner {
        exchangeRate=_newRate;
    }

    function exchangeTokenAForTokenB(uint amountA) public  {
        // Ensure contract has enough tokenB for transfer
        require(tokenB.balanceOf(address(this))>=amountA*exchangeRate,"Insufficient Tokens B");
        // Transfer tokenA from user to DEX contract
        require(tokenA.transferFrom(msg.sender,address(this),amountA),"Error: Transfer to DEX failed!");
        tokenB.transfer(msg.sender,amountA*exchangeRate);
    }
}