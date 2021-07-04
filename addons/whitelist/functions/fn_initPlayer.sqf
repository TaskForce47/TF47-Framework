#include "macros.hpp"

if (isDedicated || !hasInterface) exitWith {};

player addEventHandler ["SeatSwitchedMan", {
    params ["_unit1", "_unit2", "_vehicle"];
    if (([_unit2] call CBA_fnc_vehicleRole) isEqualTo "cargo") exitWith {};
    [_unit2, _vehicle] remoteExecCall [QFUNC(handleRoleCheck), 2];
}];

player addEventHandler ["GetInMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];
    if (_role isEqualTo "cargo") exitWith {};
    [_unit, _vehicle] remoteExecCall [QFUNC(handleRoleCheck), 2];
}];

[
    { (!isNil QGVAR(initialized) && { !isNull player }) },
    {
        [player] remoteExecCall [QFUNC(handleSlotCheck), 2];
    },
    nil,
    10,
    {
        [player, "Could not get whitelist! Please report to an admin."] call FUNC(kickToLobby);
    }
] call CBA_fnc_waitUntilAndExecute;