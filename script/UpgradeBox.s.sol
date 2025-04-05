// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {ERC1967Proxy} from "../lib/openzeppelin-contracts/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";

contract UpgradeBox is Script {
    function run() external returns (address) {
        address mostRecentlyDeployedProxy = 0xf5EC2A2AE3d6d8eC154c7991F0D03030526d82BE;

        vm.startBroadcast();
        BoxV2 newBox = new BoxV2();
        vm.stopBroadcast();
        address proxy = upgradeBox(mostRecentlyDeployedProxy, address(newBox));
        return proxy;
    }

    function upgradeBox(address proxyAddress, address newBox) public returns (address) {
        vm.startBroadcast();
        BoxV1 proxy = BoxV1(payable(proxyAddress));
        proxy.upgradeToAndCall(address(newBox),"");
        vm.stopBroadcast();
        return address(proxy);
    }
}