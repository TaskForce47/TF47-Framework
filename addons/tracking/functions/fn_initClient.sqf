#include "macros.hpp"

if (isDedicated && !hasInterface) exitWith {};

player addEventHandler ["FiredMan", {
    params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
}];