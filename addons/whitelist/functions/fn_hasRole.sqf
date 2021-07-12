#include "macros.hpp"

params [
    ["_unit", objNull, [objNull, ""]],
    ["_role", "", [""]]
];

if (_unit isEqualType objNull) then {
    if (isNull _unit) exitWith {};

    _unit = str _unit;
};

private _roles = GVAR(slotRoles) getOrDefault [_unit, []];

_role in _roles