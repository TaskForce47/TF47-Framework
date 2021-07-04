#include "macros.hpp"

params [
    ["_classnames", [], [[]]],
    ["_overwrite", false, [false]]
];

if (_overwrite) then {
    GVAR(attackAircraft) = _classnames;
} else {
    {
        GVAR(attackAircraft) pushBackUnique _x;
    } foreach _classnames;
};

true
