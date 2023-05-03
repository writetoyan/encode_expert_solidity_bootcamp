//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

/* Create a Solidity contract with one function
The solidity function should return the amount of ETH that was passed to it, and the
function body should be written in assembly */

contract EthAmount {

    function returnAmount() external payable returns (uint) {
        assembly {
            let memptr := mload(0x40)
            let amount := callvalue()
            mstore(memptr, amount)
            return (memptr, 0x20)
        }
    }

}