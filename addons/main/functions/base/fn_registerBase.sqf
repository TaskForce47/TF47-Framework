#include "macros.hpp"

params [
    ["_base", [], []],
    ["_baseName", "", [""]]
];

EXEC_ONLY_SERVER;
EXEC_ONLY_UNSCHEDULED;

if (_base isEqualTo []) exitWith { -1 };

private _baseIndex = GVAR(baseIndex);

scopeName "_main";

switch true do {
    case (_base isEqualType []): {
        if ((count _base) < 3) exitWith { -1 };
        GVAR(baseList) pushBack [_baseIndex, _base, "POLYGON", _baseName];
    };
    //marker type is a string
    case (_base isEqualType ""): {
        //check if the marker exists
        if ((getMarkerColor _base) isEqualTo "") exitWith { -1 };
        switch (markerShape _base) do {
            case "RECTANGLE": {
                GVAR(baseList) pushBack [_baseIndex, _base, "MARKER", _baseName]; 
            };
            case "ELLIPSE": {
                GVAR(baseList) pushBack [_baseIndex, _base, "MARKER", _baseName]; 
            };
            default {
                -1 breakOut "_main";
            };
        };
    };
    default {
        -1 breakOut "_main";
    };
};

GVAR(baseIndex) = _baseIndex+1;
publicVariable QGVAR(baseList);

true