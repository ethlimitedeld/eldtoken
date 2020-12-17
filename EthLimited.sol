pragma solidity 0.4.25;

import './libs/zeppelin/token/ERC20/ERC20.sol';
import './libs/zeppelin/math/SafeMath.sol';

contract EthLimited is ERC20 {
  using SafeMath for uint;

  string public constant name = 'ETH.limiteD';
  string public constant symbol = 'ELD';
  uint8 public constant decimals = 18;
  uint public totalSupply = (1 * 1e9) * (10 ** uint(decimals));
  uint public releaseAmountEveryYear = (10 * 1e6) * (10 ** uint(decimals));
  uint8 releaseCounter = 0;
  uint lastRelease = now + 156 weeks;
  address admin;

  constructor() public {
    uint intAmount = (900 * 1e6) * (10 ** uint(decimals));
    _balances[msg.sender] = intAmount;
    emit Transfer(address(0x0), msg.sender, intAmount);
    admin = msg.sender;
  }

  function unLock() public {
    require(now > lastRelease, 'Need more time');
    require(releaseCounter < 10, 'No more token to release');
    releaseCounter++;
    lastRelease = now + 52 weeks;
    _balances[admin] = _balances[admin].add(releaseAmountEveryYear);
  }

  function burn(uint _amount) public {
    require(_balances[msg.sender] >= _amount, 'Balance insufficient!!!');
    _balances[msg.sender] = _balances[msg.sender].sub(_amount);
    totalSupply = totalSupply.sub(_amount);
    emit Transfer(msg.sender, address(0x0), _amount);
  }
}

