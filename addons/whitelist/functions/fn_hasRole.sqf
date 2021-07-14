#include "macros.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_role", "", [""]]
];

if (isNull _unit) exitWith {};
private _slot = str _unit;
 
private _roles = GVAR(slotRoles) getOrDefault [_slot, []];

_role in _roles;