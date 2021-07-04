#include "macros.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_message", "You are not allowed to use this vehicle", [""]]
];

if (isNull _unit) exitWith {};
//make sure this only gets executed on players own computer
//because action and notifications are local commands
if (!local _unit) exitWith {
    _this remoteExecCall [QFUNC(kickFromVehicle), _unit];
};

[
    "TF47_core_notification_notWhitelisted",
    [_message]
] call BIS_fnc_showNotification;

player action ["GetOut", vehicle player];
moveOut player; //in case he somehow enters as unconscious

true