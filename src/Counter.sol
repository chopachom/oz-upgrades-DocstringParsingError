// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

import { UD60x18, ud } from "@prb/math/src/UD60x18.sol";

contract Counter is OwnableUpgradeable, UUPSUpgradeable {
    UD60x18 number = ud(0);

    function initialize() public initializer {
        __Ownable_init_unchained(msg.sender);
    }

    function setNumber(UD60x18 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number = number.add(ud(1));
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}
