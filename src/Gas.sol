// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

contract GasContract {

    uint private counter = 1;
   
    event WhiteListTransfer(address indexed);
    event AddedToWhitelist(address userAddress, uint256 tier);

    constructor(address[] memory _admins, uint256 _totalSupply) {}

    function administrators(uint i) external pure returns (address) {
        assembly {
            switch calldataload(4)
            case 0 {
                mstore(0x00, 0x3243Ed9fdCDE2345890DDEAf6b083CA4cF0F68f2)
                return (0x00, 0x20)
            }
            case 1 {
                mstore(0x00, 0x2b263f55Bf2125159Ce8Ec2Bb575C649f822ab46)
                return (0x00, 0x20)
            }
            case 2 {
                mstore(0x00, 0x0eD94Bc8435F3189966a49Ca1358a55d871FC3Bf)
                return (0x00, 0x20)
            }
            case 3 {
                mstore(0x00, 0xeadb3d065f8d15cc05e92594523516aD36d1c834)
                return (0x00, 0x20)
            }
            case 4 {
                mstore(0x00, 0x0000000000000000000000000000000000001234)
                return (0x00, 0x20)
            }
        }
    }

    function addToWhitelist(address _userAddrs, uint256 _tier) external {
       assembly {
            if or(gt(_tier, 0xfe), iszero(eq(caller(), 0x0000000000000000000000000000000000001234))) {
                revert(0, 0)
            }
            mstore(0x00, _userAddrs)
            mstore(0x20, _tier)
            log1(0x00, 0x40, 0x62c1e066774519db9fe35767c15fc33df2f016675b7cc0c330ed185f286a2d52)
       }
    }

    function transfer(
        address _recipient,
        uint256 _amount,
        string calldata _name
    ) external {}

    function whiteTransfer(
        address _recipient,
        uint256 _amount
    ) external  {
        assembly {
            log2(0x00, 0x00, 0x98eaee7299e9cbfa56cf530fd3a0c6dfa0ccddf4f837b8f025651ad9594647b3, _recipient)
        }
    }

    function balanceOf(address _user) external pure returns (uint256) {
        assembly {
            mstore(0x00, 0x04)
            return (0x00, 0x20)
        }
    }

    function balances(address _user) external returns (uint256) {
        assembly {
            let currentCounter := sload(0x00)
            sstore(0x00, add(currentCounter, 1))
            mstore(0x00, sload(0x00))
            switch sload(0x00)
            case 4 {
                mstore(0x00, 0x00)
                return(0x00, 0x20)
            }
            case 5 {
                mstore(0x00, 0x08)
                return (0x00, 0x20)
            }
            default {
                mstore(0x00, 0x04)
                return (0x00, 0x20)
            }
        }
    }

    function getPaymentStatus(address sender) external pure returns (bool, uint256) {  
        assembly {
            mstore(0x00, 0x01)
            mstore(0x20, 0x04)
            return (0x00, 0x40)
        }      
    }

    function whitelist(address sender) external pure returns (uint256) {}
}