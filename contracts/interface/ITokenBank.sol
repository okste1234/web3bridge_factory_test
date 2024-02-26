// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface ITokenBank {
    function deposit(uint256 _amount) external;

    function Withdraw(uint _amount) external;
}
