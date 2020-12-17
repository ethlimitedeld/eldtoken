pragma solidity 0.4.25;

contract Auth {

  address internal mainAdmin;
  address internal contractAdmin;
  address internal profitAdmin;
  address internal ethAdmin;
  address internal LAdmin;
  address internal maxSAdmin;
  address internal backupAdmin;
  address internal commissionAdmin;

  event OwnershipTransferred(address indexed _previousOwner, address indexed _newOwner);

  constructor(
    address _mainAdmin,
    address _contractAdmin,
    address _profitAdmin,
    address _ethAdmin,
    address _LAdmin,
    address _maxSAdmin,
    address _backupAdmin,
    address _commissionAdmin
  )
  internal
  {
    mainAdmin = _mainAdmin;
    contractAdmin = _contractAdmin;
    profitAdmin = _profitAdmin;
    ethAdmin = _ethAdmin;
    LAdmin = _LAdmin;
    maxSAdmin = _maxSAdmin;
    backupAdmin = _backupAdmin;
    commissionAdmin = _commissionAdmin;
  }

  modifier onlyMainAdmin() {
    require(isMainAdmin(), "onlyMainAdmin");
    _;
  }

  modifier onlyContractAdmin() {
    require(isContractAdmin() || isMainAdmin(), "onlyContractAdmin");
    _;
  }

  modifier onlyProfitAdmin() {
    require(isProfitAdmin() || isMainAdmin(), "onlyProfitAdmin");
    _;
  }

  modifier onlyEthAdmin() {
    require(isEthAdmin() || isMainAdmin(), "onlyEthAdmin");
    _;
  }

  modifier onlyLAdmin() {
    require(isLAdmin() || isMainAdmin(), "onlyLAdmin");
    _;
  }

  modifier onlyMaxSAdmin() {
    require(isMaxSAdmin() || isMainAdmin(), "onlyMaxSAdmin");
    _;
  }

  modifier onlyBackupAdmin() {
    require(isBackupAdmin() || isMainAdmin(), "onlyBackupAdmin");
    _;
  }

  modifier onlyBackupAdmin2() {
    require(isBackupAdmin(), "onlyBackupAdmin");
    _;
  }

  function isMainAdmin() public view returns (bool) {
    return msg.sender == mainAdmin;
  }

  function isContractAdmin() public view returns (bool) {
    return msg.sender == contractAdmin;
  }

  function isProfitAdmin() public view returns (bool) {
    return msg.sender == profitAdmin;
  }

  function isEthAdmin() public view returns (bool) {
    return msg.sender == ethAdmin;
  }

  function isLAdmin() public view returns (bool) {
    return msg.sender == LAdmin;
  }

  function isMaxSAdmin() public view returns (bool) {
    return msg.sender == maxSAdmin;
  }

  function isBackupAdmin() public view returns (bool) {
    return msg.sender == backupAdmin;
  }
}
