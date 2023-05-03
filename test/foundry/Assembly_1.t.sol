// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../../contracts/Assembly_1.sol";

contract IntroTest is Test {
    Intro public intro;

    function setUp() public {
        intro = new Intro();

    }

    function test_intro() public {
        uint16 introVar = intro.intro();
        assertTrue(introVar == 420);
    }


}
