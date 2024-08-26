// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IMultiSignWallet {

    struct Transaction {
        address to;
        uint256 value;
        bool executed;
        uint numConfirmations;
        address tokenaddress;
    }

    function submitTransaction(address _to, uint256 _value, address _tokenaddress) external;

    function confirmTransaction(uint256 _txIndex) external;

    function revokeConfirmation(uint256 _txIndex) external;

    function executeTransaction(uint256 _txIndex) external;

    event Deposit(address indexed sender, uint amount, uint balance);

    event SubmitTransaction(
        uint256 indexed txIndex,
        address indexed owner,
        address indexed to,
        uint256 value,
        address tokenaddress
    );
    
    event ConfirmTransaction(address indexed owner, uint256 indexed txIndex);

    event RevokeConfirmation(address indexed owner, uint256 indexed txIndex);

    event ExecuteTransaction(address indexed owner, uint256 indexed txIndex);
}