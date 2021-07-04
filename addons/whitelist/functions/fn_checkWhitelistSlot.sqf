#include "macros.hpp"

params [
    ["_unit", objNull, [objNull]]
];

if (isNull _unit) exitWith {false};

private _slotName = str _unit;
private _permissions = GVAR(slotRequiredPermissions) getOrDefault [_slotName, []];

if (_permissions isEqualTo []) exitWith {true};