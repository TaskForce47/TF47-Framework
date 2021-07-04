#include "macros.hpp"

params [
    ["_slot", objNull, ["", objNull]],
    ["_roles", [], [[]]]
];

if (isNull _slot || _roles isEqualTo []) exitWith {false};
if (_slot isEqualType objNull) then {
    _slot = str _slot;
};

//check if user has passed an invalid role
{
    if (! (_x in _validRoles)) exitWith {
        LOG_2("WARNING! COULD NOT REGISTER SLOT ROLES! PASSED INVALID ROLE!", _x);
        false
    };	
} forEach _roles;

GVAR(slotRoles) set [_slot, _roles];

true