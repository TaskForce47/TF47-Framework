#include "macros.hpp"

params [
    ["_ticketChange", 0, [0]],
    ["_isPositive", false, [false]],
    ["_message", "", [""]],
    ["_uid", "", [""]]
];

EXEC_ONLY_SERVER;

private _oldTicketCount = GVAR(tickets);

if (_isPositive) then {
    GVAR(tickets) = GVAR(tickets) + _ticketChange;
} else {
    GVAR(tickets) = GVAR(tickets) - _ticketChange;
    if (GVAR(tickets) < 0) then {
        GVAR(tickets) = 0;
    };
    _ticketChange = _ticketChange * -1;
};

if (GVAR(tickets) > GVAR(maxTickets)) then {
    GVAR(tickets) = GVAR(maxTickets);
};

publicVariable QGVAR(tickets);

[EVENT(ticketsChanged), [_ticketChange, GVAR(tickets), _message]] call CBA_fnc_globalEvent;
if (GVAR(tickets) == 0) then {
    [EVENT(outOfTickets), []] call CBA_fnc_globalEvent;
};

if (isServer && !hasInterface) then {
    "tf47_prism_sharp" callExtension ["updateTicketCount", [_ticketChange, GVAR(tickets), _message, _uid]];
};

[{ [GVAR(tickets)] call FUNC(saveTicketsToProfile); }] call CBA_fnc_execNextFrame;

true