#include "macros.hpp"

params [
    ["_vehicle", objNull, [objNull]]
];

if (isNull _vehicle) exitWith { false };
if (_vehicle getVariable [QGVAR(whitelistDisabled), false]) exitWith { false };

! (_vehicle isKindOf "ParachuteBase" || 
{ (speed _vehicle) > 5 } || 
{ ((getPos _vehicle) select 2) > 2.5 });