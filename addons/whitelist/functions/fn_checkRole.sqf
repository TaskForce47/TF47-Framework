#include "macros.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_vehicle", objNull, [objNull]],
    ["_role", "driver", [""]]
];

scopeName "_main";

private _vehicleType = ([_vehicle] call BIS_fnc_objectType) select 1;
private _roles = GVAR(slotRoles) getOrDefault [str _unit, []];
private _result = false;

switch (_vehicleType) do {
    case "Tank": {
        if (ROLE_TANK_CREW in _roles) then { true breakOut "_main"; }; 
    };
    case "TrackedAPC": {
        if (ROLE_TANK_CREW in _roles) then { true breakOut "_main"; };
    };
    case "WheeledAPC": {
        if (ROLE_TANK_CREW in _roles) then { true breakOut "_main"; };
    };
    case "Plane": {
        if ((typeOf _vehicle) in GVAR(attackAircraft)) then {
            if (_role isEqualTo "driver") then {
                if (ROLE_PLANE_ATTACK_PILOT in _roles) then { true breakOut "_main"; };
            } else {
                if (ROLE_PLANE_ATTACK_CREW in _roles) then { true breakOut "_main"; };
            };
        } else {
            if (_role isEqualTo "driver") then {
                if (ROLE_PLANE_TRANSPORT_PILOT in _roles) then { true breakOut "_main"; };
            } else {
                if (ROLE_PLANE_TRANSPORT_CREW in _roles) then { true breakOut "_main"; };
            };
        };
    };
    case "Helicopter": {
        if ((typeOf _vehicle) in GVAR(attackAircraft)) then {
            if (_role isEqualTo "driver") then {
                if (ROLE_ROTARY_ATTACK_PILOT in _roles) then { true breakOut "_main"; };
            } else {
                if (ROLE_ROTARY_ATTACK_CREW in _roles) then { true breakOut "_main"; };
            };
        } else {
            if (_role isEqualTo "driver") then {
                if (ROLE_ROTARY_TRANSPORT_PILOT in _roles) then { true breakOut "_main"; };
            } else {
                if (ROLE_ROTARY_TRANSPORT_CREW in _roles) then { true breakOut "_main"; };
            };
        };
    };
    default {
        //this servers the purpose to check if the vehicle is a vehicle without whitelist
        //it will therefore overwrite the default false return
        _result = true;
    };
};

_result

