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
            "tf47_prism_sharp" callExtension ["updateTicketCount", [GVAR(tickets), GVAR(tickets), "Session initialized", ""]];
        }
    ] call CBA_fnc_waitUntilAndExecute;
};

_ticketCount