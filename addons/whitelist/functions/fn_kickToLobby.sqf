#include "macros.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_message", "You are not allowed to use this slot", [""]]
];

if (isNull _unit) exitWith {};
if (!local _unit) exitWith {
    _this remoteExecCall [QFUNC(kickToLobby), _unit];
};

[
    "TF47NotificationNotWhitelisted ",
    [_message]
] call BIS_fnc_showNotification;

[{
    [_endName, false] call BIS_fnc_endMission;
}, nil, 4] call CBA_fnc_waitAndExecute;

true