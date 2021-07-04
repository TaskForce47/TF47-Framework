#include "macros.hpp"

params [
	["_vehicle", objNull, [objNull]]
];

if (isNull _vehicle) exitWith {""};
getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");