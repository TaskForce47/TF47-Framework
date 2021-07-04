#include "macros.hpp"

params [
    ["_unit", objNull, []]
];

if (isNull _unit) exitWith {};
//if player has sufficend permissions when can exit here
if ([_unit] call FUNC(checkWhitelistSlot)) exitWith {};

[_unit] call FUNC(kickToLobby);

true