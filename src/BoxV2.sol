// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


import {UUPSUpgradeable} from "../lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "../lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "../lib/openzeppelin-contracts-upgradeable/contracts/access/OwnableUpgradeable.sol";


contract BoxV2 is Initializable,UUPSUpgradeable,OwnableUpgradeable {
    uint256 internal value;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        __Ownable_init(msg.sender);
        __UUPSUpgradeable_init();
    }

    function setValue(uint256 newValue) public {
        value = newValue;
    }

    function getValue() public view returns (uint256) {
        return value;
    }

    function version() public pure returns (uint256) {
        return 2;
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}