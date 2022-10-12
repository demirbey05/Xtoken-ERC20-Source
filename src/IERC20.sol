// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface IERC20 {
    event Transfer(address indexed _from, address indexed _to, uint256 _value); // When transfer occurs, this event is emitted.
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    ); // When approval is occurs, this event is emitted.

    function name() external view returns (string memory); // Name of token

    function symbol() external view returns (string memory); // Symbol of token

    function decimals() external view returns (uint8); // Number of decimals, 18 recommend

    function totalSupply() external view returns (uint256); // Total supply of the token

    function balanceOf(address _owner) external view returns (uint256 balance); // Tracking the balance of each users

    function transfer(address _to, uint256 _value)
        external
        returns (bool success); // Transfer _value amount token to _to address, with msg.sender

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) external returns (bool success); // Manual transfer protocol for tokens, it checks for approval

    function approve(address _spender, uint256 _value)
        external
        returns (bool success); // llows _spender to withdraw from your account multiple times, up to the _value amount.

    //If this function is called again it overwrites the current allowance with _value
    function allowance(address _owner, address _spender)
        external
        view
        returns (uint256 remaining); //Remaining amount from which token holder allows to _spender
}
