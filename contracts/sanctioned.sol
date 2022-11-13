// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract sanctioned is Ownable {
  mapping(address => bool) public blacklist;

  // todo: add isOwner modifier
  function addAddress(address _account) onlyOwner external {
    blacklist[_account] = true;
  }

  // todo: add isOwner modifier
  function setAddresses(address[] memory _accounts) onlyOwner external {
    for (uint i=0; i < _accounts.length; i++) {
      this.addAddress(_accounts[i]);
    }
  }

  // todo: add isOwner modifier
  function removeAddress(address _account) onlyOwner external {
    delete blacklist[_account];
  } 

  // This contract only defines a modifier but does not use
  // it: it will be used in derived contracts.
  // The function body is inserted where the special symbol
  // `_;` in the definition of a modifier appears.
  // This means that if the owner calls this function, the
  // function is executed and otherwise, an exception is
  // thrown.
  modifier notBlacklisted(address _account) {
    require(!blacklist[_account], "error: acct is blacklisted");
    _;
  }
}