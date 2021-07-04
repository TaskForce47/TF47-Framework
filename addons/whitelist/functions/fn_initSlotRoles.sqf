#include "macros.hpp"

params [
    ["_unit", objNull, [objNull]]
];

if (isNull _unit) exitWith {false};

private _slot = str _unit;

{
    _unit setUnitTrait [_x, false, true];
} forEach GVAR(validRoles);

private _slotRoles = GVAR(slotRoles) getOrDefault [_slot, []];
{
    _unit setUnitTrait [_x, true, true];
} foreach _slotRoles;

true