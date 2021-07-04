#include "macros.hpp"

params [
	["_vehicle", objNull, [objNull]],
	["_cost", 0, [0]]
];

if (!isServer) exitWith {
	_this remoteExecCall [QFUNC(registerVehicle), 2];
}

if (isNull _vehicle) exitWith {};
if (_cost < 0) then { _cost = _cost * -1 };

private _objectName = [_vehicle, "tf47_vehicle_"] call BIS_fnc_objectVar;
private _displayName = [_vehicle] call EFUNC(common,getVehicleDisplayName);

GVAR(registeredVehicles) set [_objectName, [_objectName, _displayName, _cost]];

_vehicle setVariable [QGVAR(registered), true, true];
_vehicle setVariable [QGVAR(cost), _cost, true];
_vehicle setVariable [QGVAR(commanderUid), ""];

//the vehicle can be already registered but we don't want another eventhandler to be attached
if (! (_vehicle getVariable [QGVAR(registered), false])) then {

	_vehicle addMPEventHandler ["MPKilled", {
		params ["_unit"];
		if (!isServer) exitWith {};
		[_unit] call FUNC(handleVehicleKilled);
	}];

	_vehicle addEventHandler ["GetIn", {
		params ["_vehicle", "_role", "_unit"];
		if (!isPlayer _unit) exitWith {};
		if (role isEqualTo "cargo") exitWith {};

		if (role isEqualTo "commander") exitWith {
			_vehicle setVariable [QGVAR(commanderUid), getPlayerUID _unit];
		};
		if (role isEqualTo "gunner" && {isNull (commander _vehicle)}) exitWith {
			_vehicle setVariable [QGVAR(commanderUid), getPlayerUID _unit];
		};
		if (role isEqualTo "driver" && {isNull (commander _vehicle)} && {isNull (gunner _vehicle)}) exitWith {
			_vehicle setVariable [QGVAR(commanderUid), getPlayerUID _unit];
		};
	}];

	_vehicle setVariable [QGVAR(registered), true, true];
};

true