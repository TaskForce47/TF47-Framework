#include "macros.hpp"

params [
    ["_slot", "", ["", objNull]],
    ["_requiredPermissions", [], [[]]],
    ["_minimalPermissions", [], [[]]]
];

EXEC_ONLY_SERVER;

if (_slot isEqualType objNull) then {
    _slot = str _slot;
};
if (_slot isEqualTo "") exitWith {};
GVAR(slotRequiredPermissions) set [_slot, [_requiredPermissions, _minimalPermissions]];

true
