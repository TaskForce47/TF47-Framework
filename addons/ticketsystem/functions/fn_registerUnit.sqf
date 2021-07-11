#include "macros.hpp"

params [
    ["_unit", objNull, ["", objNull]],
    ["_cost", 0, [0]],
    ["_role", "Rifleman", [""]]
];

if (!isServer) exitWith {
    _this remoteExecCall [QFUNC(registerUnit), 2];
};

if (_unit isEqualType objNull) then {
    if (isNull _unit) exitWith {};
    _unit = str _unit;
};

if (_cost < 0) then { _cost = _cost * -1; };

GVAR(registeredUnits) set [_unit, [_unit, _cost, _role]];

true