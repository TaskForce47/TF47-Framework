#include "macros.hpp"

params [
    ["_slot", "", ["", objNull]],
    ["_requiredPermission", [], [[]]],
    ["_minimalPermission", [], [[]]]
];

if (slot isEqualType objNull) then {
    _slot = str _slot;
};
if (_slot isEqualTo "") exitWith {};

GVAR(slotRequiredPermissions) set ["_slot", [_requiredPermissions, _minimalPermission]];