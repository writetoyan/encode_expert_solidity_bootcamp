//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.13;

import 'forge-std/Test.sol';
import '../../contracts/Assembly_3.sol';

contract SubOverflowTest is Test {
    SubOverflow subOverflow;
    function setUp() public {
        subOverflow = new SubOverflow();
    }

    function test_subOverflow(uint x, uint y) public {
        vm.assume(x > y);
        uint z = subOverflow.subtract(x, y);
        assertEq(z, (x - y));
    }

    function test_negativeResult(uint x, uint y) public {
        vm.assume(x < y);
        uint z = subOverflow.subtract(x, y);
        assertEq(z, 0);
    }
}