#include "macros.hpp"

params [
    ["_unit", objNull, [objNull]]
];

if (isNull _unit) exitWith { false };

private _slotName = str _unit;
private _playerUid = getPlayerUID _unit;
private _permissionsSlot = GVAR(slotRequiredPermissions) getOrDefault [_slotName, []];

if (_permissionsSlot isEqualTo []) exitWith { true };

private _permissionsPlayer = GVAR(permissionCache) getOrDefault [_playerUid, []];
private _requiredPermissions = _permissionsSlot select 0;
private _overwritePermissions = _permissionsSlot select 1;


//minimal permission overrules everything for case like moderator without plane permissions 
{
    if (_x in _overwritePermissions) exitWith { true };
} foreach _permissionsPlayer;

//strict check, all the following permissions have to be fullfilled
{
    if (! (_x in _permissionsPlayer)) exitWith { false };
} foreach _requiredPermissions;

if (_overwritePermissions isEqualTo []) exitWith { true };

false
