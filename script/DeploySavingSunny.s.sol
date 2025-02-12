// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {SavingsSunnyModule} from "../src/SavingsSunnyModule.sol";

contract DeploySavingSunny is Script {
    SavingsSunnyModule public savingsSunnyModule; 

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        savingsSunnyModule = new SavingsSunnyModule(0x713DD7C3c06b094665Ef3a60C73593F9919DC057);

        vm.stopBroadcast();
        console.log("Saving Sunny module: ", address(savingsSunnyModule));
    }
}
