#include "macros.hpp"

params ["_unit"];

EXEC_ONLY_SERVER;

private _slotName = str _unit;
private _data = GVAR(registeredUnits) getOrDefault [_slotName, []];

if (_data isEqualTo []) exitWith {false}; //unit is not registered, cancel at this point

private _uid = getPlayerUID _unit;
private _cost = _data select 1;
private _message = format ["%1 died. We lost %2 tickets!", _data select 2, _cost];

[_cost, false, _message, _uid] call FUNC(changeTickets);

true