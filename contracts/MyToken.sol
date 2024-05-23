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
        uint amountB=amountA*exchangeRate;
        require(tokenA.balanceOf(msg.sender) >= amountA, "Insufficient tokenA balance");
        require(tokenB.balanceOf(address(this)) >= amountB, "Insufficient tokenB balance");
        require(tokenA.transferFrom(msg.sender, address(this), amountA), "Error: Transfer of tokenA to DEX failed!");
        require(tokenB.transfer(msg.sender, amountB), "Error: Transfer of tokenB to user failed!");   
    }
}