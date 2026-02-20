// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title SimpleCryptoToken
 * @dev Standard ERC20 token with a batch distribution function for airdrops.
 */
contract SimpleCryptoToken is ERC20, Ownable {

    constructor(string memory name, string memory symbol, uint256 initialSupply) 
        ERC20(name, symbol) 
        Ownable(msg.sender) 
    {
        _mint(msg.sender, initialSupply * 10 ** decimals());
    }

    /**
     * @dev Distributes tokens to multiple addresses in one transaction to save gas.
     * @param recipients Array of addresses to receive tokens.
     * @param amounts Array of amounts to send to each address.
     */
    function multiSend(address[] calldata recipients, uint256[] calldata amounts) external {
        require(recipients.length == amounts.length, "Arrays must be the same length");
        
        for (uint256 i = 0; i < recipients.length; i++) {
            _transfer(msg.sender, recipients[i], amounts[i]);
        }
    }
}
