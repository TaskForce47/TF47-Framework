#include "marcos.hpp"

params [
    ["_vehicle", objNull, [objNull]]
];

if (isNull _vehicle) exitWith {false};

! (
    _vehicle isKindOf "ParachuteBase" ||
    { (speed _vehicle) > 5 } ||
    { !isTouchingGround _vehicle } ||
    { (getPosAGL select 2) > 2.5 }
)