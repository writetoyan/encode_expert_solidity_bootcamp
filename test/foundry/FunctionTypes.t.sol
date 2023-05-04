//SPDX-License-Identifier

pragma solidity 0.8.17;

import 'forge-std/Test.sol';
import 'contracts/FunctionTypes.sol';
import 'contracts/mocks/Token.sol';

contract FunctionTypesTest is Test {

    TreasuryAdmin treasuryAdmin;
    SpenderDepartment spenderDepartment;
    address tokenAddress;

    function setUp() public {
        treasuryAdmin = new TreasuryAdmin();
        tokenAddress = address(treasuryAdmin.token());
        spenderDepartment = new SpenderDepartment(address(treasuryAdmin), tokenAddress);
        treasuryAdmin.mint(address(spenderDepartment), 10000e18);
    }

    function test_balance() public {
        assertEq(Token(tokenAddress).balanceOf(address(spenderDepartment)), 10000e18);
    }

    function test_authorizeSpendMoney(uint amount) public {
        vm.assume(amount < Token(tokenAddress).balanceOf(address(spenderDepartment)));
        uint receiverBalanceBefore = Token(tokenAddress).balanceOf(address(1));
        spenderDepartment.requestSpendMoney(address(1), amount);
        treasuryAdmin.authorizeSpendMoney(0, true);
        uint receiverBalanceAfter = Token(tokenAddress).balanceOf(address(1));
        assertEq(receiverBalanceAfter, receiverBalanceBefore + amount);
    }

}