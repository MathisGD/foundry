// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import "ds-test/test.sol";
import "./Cheats.sol";

contract CoolTest is DSTest {
    Cheats constant cheats = Cheats(HEVM_ADDRESS);

    uint256 a;

    function testCoolStorageSlot() public {
        uint256 foo;
        uint256 gasBefore;
        uint256 gasAfter;

        assembly {
            gasBefore := gas()
            foo := sload(a.slot)
            gasAfter := gas()
        }
        assertEq(gasAfter, gasBefore - 2100 - 15);

        assembly {
            gasBefore := gas()
            foo := sload(a.slot)
            gasAfter := gas()
        }
        assertEq(gasAfter, gasBefore - 100 - 15);

        cheats.cool();

        assembly {
            gasBefore := gas()
            foo := sload(a.slot)
            gasAfter := gas()
        }
        assertEq(gasAfter, gasBefore - 2100 - 15);
    }
}
