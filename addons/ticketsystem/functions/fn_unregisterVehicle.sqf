#include "macros.hpp"

params [
    ["_vehicle", objNull, [objNull]]
];

if (isNull _vehicle) exitWith { false };
if (! (_vehicle getVariable [QGVAR(registered), false])) exitWith { false };

_vehicle removeMPEventHandler ["MPKilled", _vehicle getVariable [QGVAR(killedEh), -1]];
_vehicle removeEventHandler ["GetIn", _vehicle getVariable [QGVAR(getInEh), -1]];
_vehicle setVariable [QGVAR(registered), false, true];

true