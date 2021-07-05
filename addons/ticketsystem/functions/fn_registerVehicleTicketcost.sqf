#include "macros.hpp"

params [
    ["_classnames", [], [[]]]
];

{
    _x params ["_classname", "_cost"];
    GVAR(vehicleTicketCosts) set [_classname, _cost];
} foreach _classnames;

true