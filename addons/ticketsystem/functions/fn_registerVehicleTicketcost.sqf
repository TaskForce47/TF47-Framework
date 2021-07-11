#include "macros.hpp"

params [
    ["_classnames", [], [[]]]
];

EXEC_ONLY_SERVER;

{
    _x params ["_classname", "_cost"];
    GVAR(vehicleTicketCosts) set [_classname, _cost];
} foreach _classnames;

true