// SPDX-License-Identifier:MIT

pragma solidity 0.8.17;

import "./IERC20.sol";

contract ERC20 is IERC20 {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    error NotAuthorized();

    // Transfer function from msg.sender
    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        balanceOf[msg.sender] -= _value;
        unchecked {
            balanceOf[_to] += _value;
        }

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        if (allowance[_from][msg.sender] != type(uint256).max) {
            allowance[_from][msg.sender] -= _value;
        }

        balanceOf[_from] -= _value;
        unchecked {
            balanceOf[_to] += _value;
        }
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value)
        public
        returns (bool success)
    {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function _mint(address _to, uint256 _value) internal virtual {
        totalSupply += _value;

        unchecked {
            balanceOf[_to] += _value;
        }
        emit Transfer(address(0), _to, _value);
    }

    function _burn(address _from, uint256 _value) internal virtual {
        balanceOf[_from] -= _value;

        unchecked {
            totalSupply -= _value;
        }
        emit Transfer(_from, address(0), _value);
    }
}
