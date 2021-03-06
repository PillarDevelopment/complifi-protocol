// "SPDX-License-Identifier: GNU General Public License v3.0"

pragma solidity >=0.4.21 <0.7.0;

import "./CollateralSplitParent.sol";

contract StableSplit is CollateralSplitParent{
    function symbol() external override view returns (string memory) {
        return 'Stab';
    }

    function splitNominalValue(int _normalizedValue) public override pure returns(int){
        if(_normalizedValue < -(FRACTION_MULTIPLIER/2)) { // < -0.5
            return FRACTION_MULTIPLIER; // 100%
        }

        if(_normalizedValue >= -(FRACTION_MULTIPLIER/2)) { // >= -0.5
            return FRACTION_MULTIPLIER * FRACTION_MULTIPLIER / (2 * FRACTION_MULTIPLIER  + _normalizedValue * 2);  // 1/(2+2*U)
        }
        return 0;
    }
}
