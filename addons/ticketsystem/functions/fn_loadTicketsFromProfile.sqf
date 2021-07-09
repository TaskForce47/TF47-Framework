#include "macros.hpp"

private _ticketCount = profileNameNamespace getVariable [format ["%1_%2", QGVAR(savedTickets), worldName], -1];
if (_ticketCount == -1) then {
    _ticketCount = GVAR(defaultTickets);
};

[_ticketCount, _ticketCount, "Session initialized", ""] call EFUNC(prism,updateTicketCount);

_ticketCount