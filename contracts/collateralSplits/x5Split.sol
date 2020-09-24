// "SPDX-License-Identifier: GNU General Public License v3.0"

pragma solidity >=0.4.21 <0.7.0;

import "./CollateralSplitParent.sol";

contract x5Split is CollateralSplitParent{
    function symbol() external override view returns (string memory) {
        return 'x5';
    }

    function splitNominalValue(int _normalizedValue) public override pure returns(int _split){
        _split = 0;
        if(_normalizedValue >= FRACTION_MULTIPLIER/5) { // 0.2
            _split = FRACTION_MULTIPLIER; // 100%
        }

        if(_normalizedValue <= -(FRACTION_MULTIPLIER/5)) { // -0.2
            _split = 0; // 0%
        }

        if(_normalizedValue > -(FRACTION_MULTIPLIER/5) && _normalizedValue < FRACTION_MULTIPLIER/5) {
            _split = (FRACTION_MULTIPLIER + _normalizedValue * 5) / 2;  // (1+5*U) / 2
        }
    }
}
