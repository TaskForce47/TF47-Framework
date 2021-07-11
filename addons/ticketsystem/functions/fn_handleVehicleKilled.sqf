#include "macros.hpp"

params ["_vehicle"];

EXEC_ONLY_SERVER;

private _objectName = [_vehicle, "tf47_vehicle_"] call BIS_fnc_objectVar;
private _data = GVAR(registeredVehicles) getOrDefault [_objectName, []];

if (_data isEqualTo []) exitWith { false }; //vehicle is not registered, cancel at this point

private _uid = _vehicle getVariable [QGVAR(commanderUid), ""];
private _cost = _data select 2;
private _message = format ["%1 has been destroyed. We lost %2 tickets!", _data select 1, _cost];

[_cost, false, _message, _uid] call FUNC(changeTickets);

GVAR(registeredVehicles) deleteAt _objectName;

true
