// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./interface/IWCXToken.sol";

error NO_ZERO_ACCOUNT();
error NO_ZERO_VALUE();
error INSUFFICIENT_BAL();
error NOT_AUTHORIZED();

contract TokenBank {
    address TokenAddress;

    uint256 allAmout;

    constructor(address _tokenAddress) {
        TokenAddress = _tokenAddress;
    }

    mapping(address => bool) hasDeposited;

    mapping(address => uint) depositorBal;

    function deposit(uint256 _amount) external {
        if (msg.sender == address(0)) {
            revert NO_ZERO_ACCOUNT();
        }

        if (_amount <= 0) {
            revert NO_ZERO_VALUE();
        }

        require(
            IWCXToken(TokenAddress).balanceOf(msg.sender) >= _amount,
            "insufficient tokens"
        );

        require(
            IWCXToken(TokenAddress).transferFrom(
                msg.sender,
                address(this),
                _amount
            ),
            "unsuccessful"
        );

        depositorBal[msg.sender] = depositorBal[msg.sender] + _amount;

        hasDeposited[msg.sender] = true;

        allAmout = allAmout + _amount;
    }

    function Withdraw(uint _amount) external {
        if (msg.sender == address(0)) {
            revert NO_ZERO_ACCOUNT();
        }

        if (!hasDeposited[msg.sender]) {
            revert NOT_AUTHORIZED();
        }

        if (depositorBal[msg.sender] < _amount) {
            revert INSUFFICIENT_BAL();
        }

        depositorBal[msg.sender] = depositorBal[msg.sender] - _amount;

        allAmout = allAmout - _amount;

        IWCXToken(TokenAddress).transfer(msg.sender, _amount);
    }

    function getUserBal() external view returns (uint) {
        if (!hasDeposited[msg.sender]) {
            revert NOT_AUTHORIZED();
        }

        return depositorBal[msg.sender];
    }

    function getAllBal() external view returns (uint) {
        return allAmout;
    }
}
