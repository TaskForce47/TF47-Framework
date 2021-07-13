#include "macros.hpp"

params [
    ["_pos", [], [[]]],
    ["_range", 0, [0]],
    ["_ownSide", west, [west]]
];

private _opposingForces = [];

switch (_ownSide) do {
    case west: {
        _opposingForces pushBack east;
        if (_ownSide getFriend independent >= 0.6) then {
            _opposingForces pushBack independent;
        };
    };
    case east: {
        _opposingForces pushBack west;
        if (_ownSide getFriend independent >= 0.6) then {
            _opposingForces pushBack independent;
        };
    };
    case independent: {
        if (_ownSide getFriend west >= 0.6) then {
        _opposingForces pushBack west;
        };
        if (_ownSide getFriend east >= 0.6) then {
            _opposingForces pushBack east;
        };
    };
    default {
        ["Civilan is not provided for thread scan"] call BIS_fnc_error;
    };
};

private _objects = (nearestObjects [_pos, ["Men", "AllVehicles"], _range]) select { 
    !isAgent teamMember _x && 
    { (side _x) in _opposingForces }
};

private _fnc_getThreadLevel = {
    params ["_object", "_range"];

    if (_object isKindOf "Man") then {
        private _secondaryWeapon = secondaryWeapon _object;
        if (_secondaryWeapon == "") exitWith { 0 };
        private _result = _object call _fnc_analyzeLauncher;

        if ((_result select 1) >= 1) exitWith { 1 };
    };
    0
};

private _fnc_analyzeLauncher = {
    params ["_unit"];
    private _result = [];
    private _magazines = getArray (configFile >> "CfgWeapons" >> secondaryWeapon _unit >> "magazines");
    {
        private _ammo = getText (configFile >> "CfgMagazines" >> _x >> "ammo");
        private _airLock = getNumber (configFile >> "CfgAmmo" >> _ammo >> "airlock");
        private _lockTypes = getText (configFile >> "CfgAmmo" >> _ammo >> "weaponLockSystem");
        private _cmImunity = getText (configFile >> "CfgAmmo" >> _ammo >> "cmimmunity");
        private _damage = getNumber (configFile >> "CfgAmmo" >> _ammo >> "hit");
        _result pushBack [_ammo, _airLock, _lockTypes, _cmImunity, _damage];
    } foreach _magazines;
    
    _result
};

private _result = _objects apply {
    private _range = _x distance _pos;
    [_x, typeOf _x, name _x, _range, _x call _fnc_getThreadLevel]
};

_result