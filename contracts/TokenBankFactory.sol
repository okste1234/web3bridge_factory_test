// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./TokenBank.sol";

contract TokenBankFactory {
    TokenBank[] tokenBankClones;

    function createTokenBank(
        address _tokenAddress
    ) external returns (TokenBank newBank_, uint256 length_) {
        newBank_ = new TokenBank(_tokenAddress);

        tokenBankClones.push(newBank_);

        length_ = tokenBankClones.length;
    }

    function getTokenBanks() external view returns (TokenBank[] memory) {
        return tokenBankClones;
    }
}
