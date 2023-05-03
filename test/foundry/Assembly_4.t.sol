//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.17;

import 'forge-std/Test.sol';
import '../../contracts/Assembly_4.sol';

contract IncrementTest is Test {

    Scope scope;

    function setUp() public {
        scope = new Scope();
    }

    function test_increment(uint x) public {
        uint count = scope.count();
        vm.assume(x < 10000);
        scope.increment(x);
        uint newCount = scope.count();
        assertEq(newCount, count + x);
    }

}