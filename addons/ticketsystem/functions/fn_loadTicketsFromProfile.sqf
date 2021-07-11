#include "macros.hpp"

EXEC_ONLY_SERVER;

private _ticketCount = profileNamespace getVariable [format ["%1_%2", QGVAR(savedTickets), worldName], -1];
if (_ticketCount == -1) then {
    _ticketCount = GVAR(defaultTickets);
};

if (isServer && !hasInterface) then {
    [
        { !isNil QEGVAR(main,sessionId) },
        {
            [_ticketCount, _ticketCount, "Session initialized", ""] call EFUNC(prism,updateTicketCount);
        }
    ] call CBA_fnc_waitUntilAndExecute;
};

_ticketCount