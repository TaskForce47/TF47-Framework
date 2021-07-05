#include "macros.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_vehicle", objNull, [objNull]]
];

private _vehicleType = ([_vehicle] call BIS_fnc_objectType) select 1;

switch (_vehicleType) do {
    case "Tank": {
        if (_unit getUnitTrait ROLE_TANK_CREW) exitWith { true }; 
    };
    case "TrackedAPC": {
        if (_unit getUnitTrait ROLE_TANK_CREW) exitWith { true };
    };
    case "WheeledAPC": {
        if (_unit getUnitTrait ROLE_TANK_CREW) exitWith { true };
    };
    case "Plane": {
        if ((typeOf _vehicle) in GVAR(attackAircraft)) then {
            if (driver _vehicle isEqualTo _unit) then {
                if (_unit getUnitTrait ROLE_PLANE_ATTACK_PILOT) exitWith { true };
            } else {
                if (_unit getUnitTrait ROLE_PLANE_ATTACK_CREW) exitWith { true };
            };
        } else {
            if (driver _vehicle isEqualTo _unit) then {
                if (_unit getUnitTrait ROLE_PLANE_TRANSPORT_PILOT) exitWith { true };
            } else {
                if (_unit getUnitTrait ROLE_PLANE_TRANSPORT_CREW) exitWith { true };
            };
        };
    };
    case "Helicopter": {
        if ((typeOf _vehicle) in GVAR(attackAircraft)) then {
            if (driver _vehicle isEqualTo _unit) then {
                if (_unit getUnitTrait ROLE_ROTARY_ATTACK_PILOT) exitWith { true };
            } else {
                if (_unit getUnitTrait ROLE_ROTARY_ATTACK_CREW) exitWith { true };
            };
        } else {
            if (driver _vehicle isEqualTo _unit) then {
                if (_unit getUnitTrait ROLE_ROTARY_TRANSPORT_PILOT) exitWith { true };
            } else {
                if (_unit getUnitTrait ROLE_ROTARY_TRANSPORT_CREW) exitWith { true };
            };
        };
    };
};

false
