// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../TokenBank.sol";

interface ITokenBankFactory {
    function createTokenBank(
        address _tokenAddress
    ) external returns (TokenBank newBank_, uint256 length_);

    function getTokenBanks() external view returns (TokenBank[] memory);
}
