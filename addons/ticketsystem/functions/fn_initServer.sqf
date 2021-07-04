#include "macros.hpp"

if (!isServer) exitWith {};

GVAR(tickets) = call FUNC(loadTicketsFromProfile);
publicVariable QGVAR(tickets);
GVAR(registeredVehicles) = createHashMap;
GVAR(registeredUnits) = createHashMap;

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

	private _slotName = str _unit;
	private _data = GVAR(registeredUnits) getOrDefault [_slotName, []];
	if (_data isEqualTo []) exitWith {}; //unit is not registered, cancel at this point
	if (! (_unit call ace_medical_status_fnc_hasStableVitals)) exitWith {};

	private _cost = _data select 1;
	private _message = format ["A %1 disconnected in an unstable state. We lost %2 tickets!", _data select 2, _cost];

	[_cost, false, _message, _uid] call FUNC(changeTickets);

	false //this must return false otherwise unit becomes ai
}];