#include "macros.hpp"

params [
    ["_classnames", [], [[]]],
    ["_overwrite", false, [false]]
];

if (_overwrite) exitWith {
    GVAR(ignoreList) = _classnames;
    true
};

{
    GVAR(ignoreList) pushBackUnique _x;
} foreach _classnames;

true