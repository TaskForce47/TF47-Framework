#include "macros.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_vehicle", objNull, [objNull]]
];

if (isNull _unit) exitWith {};
if (isNull _vehicle) exitWith {};
//make sure we dont kick a player from a parachute or flying something
if (! ([_vehicle] call FUNC(isValidVehicle))) exitWith {};

if ([_unit, _vehicle] call FUNC(checkRole)) exitWith {};

[_unit, "You are not on the correct slot to use this vehicle"] call FUNC(kickFromVehicle);

true
