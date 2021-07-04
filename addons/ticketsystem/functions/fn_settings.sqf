#include "macros.hpp"
[
    QGVAR(enableTicketsystem),
    "CHECKBOX",
    ["Enable Ticketsystem", "Enables or disables the ticketsystem"],
    ["TF47", "Ticketsystem"],
    true,
    1,
    nil,
    true
] call CBA_fnc_addSettings;

[
    QGVAR(defaultTickets),
    "LIST",
    ["Default tickets", "Ticket count the mission starts with"],
    ["TF47", "Ticketsystem"],
    [[100, 150, 200], [], 0],
    1
] call CBA_fnc_addSettings;

[
    QGVAR(maxTickets),
    "LIST",
    ["Max tickets", "Maximal amount of tickets allowed at every given time"],
    ["TF47", "Ticketsystem"],
    [[100, 150, 200], [], 0],
    1
] call CBA_fnc_addSettings;

[
    QGVAR(endSession),
    "CHECKBOX",
    ["End session", "Ends a session if no more tickets are available"],
    ["TF47", "Ticketsystem"],
    true,
    1
] call CBA_fnc_addSettings;

[
    QGVAR(endSessionTimeout),
    "SLIDER",
    ["Timeout befor session end", "Timeout before the session ends"],
    ["TF47", "Ticketsystem"],
    [0, 600, 60, 0, true],
    1
] call CBA_fnc_addSettings;

[
    QGVAR(logToDatabasea),
    "CHECKBOX",
    ["Log to database", "logs the ticketchange to the database"],
    ["TF47", "Ticketsystem"],
    true,
    1
] call CBA_fnc_addSettings;

LOG("TF47 Ticketsystem settings loaded!");