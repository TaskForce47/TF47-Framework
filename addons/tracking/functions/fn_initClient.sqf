#include "macros.hpp"

if (isDedicated && !hasInterface) exitWith {};

GVAR(firedProjectiles) = [];
GVAR(projectileId) = 0;


player addEventHandler ["FiredMan", {
    params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

    GVAR(firedProjectiles) pushBack [GVAR(projectileId), _projectile, [_ammo, _magazine, _weapon, _mode]];
    _projectile setVehicleVarName str GVAR(projectileId);
    GVAR(projectileId) = GVAR(projectileId) + 1;
}];

[{
    private _id = (GVAR(firedProjectiles) findIf { isNull (_x select 1) });
    if (_id isEqualTo -1) exitWith {};
    diag_log format ["[TF47] Tracking: Projectile %1 destroyed", GVAR(firedProjectiles) select _id select 0];
    GVAR(firedProjectiles) deleteAt _id;
}, 0] call CBA_fnc_addPerFrameHandler;

[
    {
        private _firedProjectiles = GVAR(firedProjectiles);
        {
            if (isNull (_x select 1)) then { continue };
            diag_log format ["[TF47] Tracking: Projectile Id: %1 pos update: %2, speed: %3", _x select 0, getPos (_x select 1), speed (_x select 1)];
        } foreach _firedProjectiles;
    },
    1
] call CBA_fnc_addPerFrameHandler;

[
    "CAManBase",
    "HitPart",
    {
        if (!alive (_this select 0 select 0)) exitWith {};
        {
            _x params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];
            private _firedProjectiles = GVAR(firedProjectiles);
            private _id = _firedProjectiles findif { (_x select 1) isEqualTo _projectile };
            if (_id == -1) then { continue };
            private _cachedProjectile = _firedProjectiles select _id;

            private _msg = format ["[TF47] Tracking: Projectile Id: %1 hit target %2, selections %4, ammo values: %3", _cachedProjectile select 0, name _target, _ammo, _selection];

            _target setVariable [QGVAR(lastHitProjectile), _cachedProjectile];

            systemChat _msg;
            diag_log _msg;
        } foreach _this;
    },
    true,
    [],
    true
] call CBA_fnc_addClassEventHandler;

[
    "CAManBase",
    "init",
    {
        params ["_unit"];
        _unit addEventHandler ["Killed", {
            params ["_unit", "_killer", "_instigator", "_useEffects"];

            private _cachedProjectile = _unit getVariable [QGVAR(lastHitProjectile), []];
            if (_cachedProjectile isEqualTo []) exitWith { diag_log "[TF47] Tracking: No own projectile killed target"};

            private _msg = format ["[TF47] Tracking: Projectile Id: %1 killed target %2", _cachedProjectile select 0, name _unit];
            systemChat _msg;
            diag_log _msg;
        }];
    },
    true,
    [],
    true
] call CBA_fnc_addClassEventHandler;