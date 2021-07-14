#include "macros.hpp"

params ["_weapon"];

scopeName "_main";

//accelerate by caching
private _cachedResult = GVAR(antiAirWeaponCache) getOrDefault [_weapon, []];
if (_cachedResult isNotEqualTo []) exitWith { _cachedResult };

private _magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
{
	private _ammo = getText (configFile >> "CfgMagazines" >> _x >> "ammo");
	private _airLock = (_ammo call FUNC(analyseMissile)) select 2;  
	if (_airLock > 0) then {
		GVAR(antiAirWeaponCache) set [_weapon, true]; //set cache
		true breakOut "_main";
	};
} foreach _magazines;

false
