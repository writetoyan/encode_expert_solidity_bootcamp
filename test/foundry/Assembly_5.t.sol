//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.17;

import 'forge-std/Test.sol';
import '../../contracts/Assembly_5.sol';

contract EthAmountTest is Test {

    EthAmount ethAmount;

    function setUp() public {
        ethAmount = new EthAmount();
    }

    function test_returnAmount() external {
        uint allo = ethAmount.returnAmount{value: 1 ether}();
        assertEq(allo, 1 ether);
    }

}