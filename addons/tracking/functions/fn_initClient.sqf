#include "macros.hpp"

if (isDedicated && !hasInterface) exitWith {};

GVAR(firedProjectiles) = [];
GVAR(projectileId) = 0;

player addEventHandler ["FiredMan", {
    params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

    GVAR(firedProjectiles) pushBack [GVAR(projectileId), [_ammo, _magazine, _weapon, _mode]];
    _projectile setVehicleVarName str GVAR(projectileId);
    GVAR(firedProjectiles) = GVAR(firedProjectiles) + 1;
}];