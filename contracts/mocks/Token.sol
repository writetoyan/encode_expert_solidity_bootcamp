//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.17;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract Token is ERC20, Ownable {

    constructor() ERC20("Token", "TKN") {}

    function mint(address to, uint amount) external onlyOwner {
        _mint(to, amount);
    }
}