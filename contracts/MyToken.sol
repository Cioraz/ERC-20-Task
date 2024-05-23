// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// SimpleDEX Smart Contract
contract SimpleDEX{
    address public owner;
    // ERC20 type tokens
    IERC20 public tokenA;
    IERC20 public tokenB;
    uint public exchangeRate;

    // Ensuring only owner is allowed to carry out modifications
    modifier onlyOwner(){
        require(msg.sender==owner,"Error: Not Authorised!");
        _;
    }

    // Contructs the owner and tokens from their address along with rate
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
        // Ensures enough tokenA balance is there in account
        require(tokenA.balanceOf(msg.sender)>=amountA, "Insufficient tokenA balance");
        // Ensures contract has enough tokenB
        require(tokenB.balanceOf(address(this))>=amountB, "Insufficient tokenB balance in contract");
        // Carry transfer (user->contract and then contract->user)
        require(tokenA.transferFrom(msg.sender, address(this), amountA), "Error: Transfer of tokenA to DEX failed!");
        require(tokenB.transfer(msg.sender, amountB), "Error: Transfer of tokenB to user failed!");   
    }

    function exchangeTokenBForTokenA(uint amountB) public {
        uint amountA=amountB*exchangeRate;
        // Ensures enough tokenB balance is in account
        require(tokenB.balanceOf(msg.sender)>=amountB,"Insufficient tokenB balance");
        // Ensures contract has enough tokenA
        require(tokenA.balanceOf(address(this))>=amountA,"Insufficient tokenA balance in contract");
        // Carry transfer (user->contract and then contract->user)
        require(tokenB.transferFrom(msg.sender, address(this), amountB),"Error: Transfer of tokenB to DEX failed!");
        require(tokenA.transfer(msg.sender, amountA),"Error: Transfer of tokenA to user failed!");
    }
}