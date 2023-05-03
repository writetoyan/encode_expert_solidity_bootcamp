//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.13;

import 'forge-std/Test.sol';
import '../../contracts/Assembly_2.sol';

contract AddTest is Test {
    Add add;
    function setUp() public {
        add = new Add();
    }

    function test_add(uint x, uint y) public {
        vm.assume(x < 10000);
        vm.assume(y < 10000);
        uint z = add.addAssembly(x, y);
        assertEq((x + y), z);
    }
}