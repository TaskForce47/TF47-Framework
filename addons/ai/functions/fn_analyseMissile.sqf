#include "macros.hpp"

params ["_ammo"];

//use cached results if possible
private _result = GVAR(missileDataCache) getOrDefault [_ammo, []];
if (_result isNotEqualTo []) exitWith { _result };

private _airLock = getNumber (configFile >> "CfgAmmo" >> _ammo >> "airlock");
private _lockTypes = getText (configFile >> "CfgAmmo" >> _ammo >> "weaponLockSystem");
private _cmImunity = getText (configFile >> "CfgAmmo" >> _ammo >> "cmimmunity");
private _damage = getNumber (configFile >> "CfgAmmo" >> _ammo >> "hit");

//split by + and then eliminate whitespaces
_lockTypes = _lockTypes splitString "+" apply { 
	private _temp = toArray _x; 
	while {32 in _temp} do {
    	_temp deleteAt _temp find 32;
	};
	toString _temp;
};

_result = [_ammo, _damage, _airLock, _lockTypes, _cmImunity];
GVAR(missileDataCache) set [_ammo, _result]; //cache result
_result
