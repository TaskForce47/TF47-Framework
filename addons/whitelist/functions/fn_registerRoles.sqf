#include "macros.hpp"

params [
	["_slot", objNull, ["", objNull]],
	["_roles", [], [[]]]
];

if (isNull _slot || _roles isEqualTo []) exitWith {false};
if (_slot isEqualType objNull) then {
	_slot = str _slot;
};

private _validRoles = [
	"TF47_role_tank_crew",
	"TF47_role_plane_transport_crew",
	"TF47_role_plane_transport_pilot",
	"TF47_role_plane_attack_pilot",
	"TF47_role_plane_attack_crew",
	"TF47_role_rotary_transport_crew",
	"TF47_role_rotary_transport_pilot",
	"TF47_role_rotary_attack_pilot",
	"TF47_role_rotary_attack_crew",
	"TF47_role_uav_small",
	"TF47_role_uav_large"
];

//check if user has passed an invalid role
{
	if (! (_x in _validRoles)) exitWith {
		LOG_2("WARNING! COULD NOT REGISTER SLOT ROLES! PASSED INVALID ROLE!", _x);
		false
	};	
} forEach _roles;

GVAR(slotRoles) set [_slot, _roles];

true