// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import { sanctioned } from "./sanctioned.sol";


contract demo is sanctioned {
    // This contract inherits the `notBlacklisted` modifier from
    // `sanctioned` and applies it to the `doThing` function, which
    // causes that calls to `destroy` only have an effect if
    // they are made by the stored owner.
    function doThing() public view notBlacklisted(msg.sender) returns(address) {
        return msg.sender;
    }
}
