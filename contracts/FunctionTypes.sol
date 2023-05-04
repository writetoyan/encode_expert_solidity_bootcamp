//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.17;

/* The parameter X represents a function.
Complete the function signature so that X is a standard ERC20 transfer function (other than
the visibility)
The query function should revert if the ERC20 function returns false */

import './mocks/Token.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

error ReturnedFalse();

contract TreasuryAdmin is Ownable {

    struct Request {
        uint amount;
        address receiver;
        function(address, uint) external returns (bool) X;
        Status status;
    }

    enum Status {
        Pending,
        Authorized,
        Denied
    }

    Request[] private requests;
    Status status;

    Token public token;

    constructor() {
        token = new Token();
    }

    function query(uint _amount, address _receiver, function(address, uint) external returns (bool) X) public {
        requests.push(Request(_amount, _receiver, X, Status.Pending));
    }

    function authorizeSpendMoney(uint requestId, bool response) external onlyOwner {
        if (!response) {
            requests[requestId].status = Status.Denied;
        } else {
            requests[requestId].status = Status.Authorized;
            Request memory request = requests[requestId];
            address receiver = request.receiver;
            uint amount = request.amount;
            request.X(receiver, amount);
        }
    } 

    function mint(address to, uint amount) external onlyOwner {
        token.mint(to, amount);
    }

    function getRequestStatus(uint requestId) external view returns (Status) {
        return requests[requestId].status;
    }
}


error NotAdmin();

contract SpenderDepartment {

    TreasuryAdmin treasuryAdmin;
    Token token;

    constructor(address _treasuryAdmin, address _token) {
        treasuryAdmin = TreasuryAdmin(_treasuryAdmin);
        token = Token(_token);
    }

    function requestSpendMoney(address receiver, uint amount) external {
        treasuryAdmin.query(amount, receiver, this.transfer);
    }

    function transfer(address to, uint256 amount) public returns (bool) {
        if (msg.sender != address(treasuryAdmin)) {
            revert NotAdmin();
        }
        token.transfer(to, amount);
        return true;
    }
}