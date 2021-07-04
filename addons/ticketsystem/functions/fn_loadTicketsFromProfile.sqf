#include "macros.hpp"

private _ticketCount = missionNamespace getVariable [format ["%1_%2", QGVAR(savedTickets), worldName], -1];
if (_ticketCount == -1) then {
	_ticketCount = GVAR(defaultTickets);
};
_ticketCount