#include "macros.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_message", "You are not allowed to use this slot", [""]]
];

if (isNull _unit) exitWith {};
if (!local _unit) exitWith {
    _this remoteExecCall [QFUNC(kickToLobby), _unit];
};

["TF47WhitelistedSlot", false] call BIS_fnc_endMission;


true