// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract tokenA is ERC20, ERC20Permit {
    uint256 public INITIAL_SUPPLY = 1000000 * 10**decimals(); 

    constructor() ERC20("tokenA", "TOA") ERC20Permit("tokenA") {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}