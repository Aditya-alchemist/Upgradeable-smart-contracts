// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


import {UUPSUpgradeable} from "../lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "../lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "../lib/openzeppelin-contracts-upgradeable/contracts/access/OwnableUpgradeable.sol";

contract BoxV1 is Initializable,UUPSUpgradeable,OwnableUpgradeable {

    // deployed at 0xbe78436b3083daece00294b74dda139c2ee47f2f
    uint256 internal number;

    function getNumber() external view returns (uint256) {
        return number;
    }


   constructor() {
        _disableInitializers();
    }

    function initialize() public initializer  {
        __Ownable_init(msg.sender);
        __UUPSUpgradeable_init();
    }

    function version() external pure returns (uint256) {
        return 1;
    }

  function _authorizeUpgrade(address newImplementation) internal override {

  }
  


}