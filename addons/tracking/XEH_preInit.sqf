#include "script_component.hpp"

LOG("TF47 tracking running preInit!");

[
    QGVAR(enableTicketsystem),
    "CHECKBOX",
    ["Enable Ticketsystem", "Enables or disables the ticketsystem"],
    ["TF47 Framework", "Ticketsystem"],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(enableAutoRegistering),
    "CHECKBOX",
    ["Enables auto registering of spawned vehicles", "Will try to register a new vehicle with tickets if classname is found in a predefined list"],
    ["TF47 Framework", "Ticketsystem"],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(defaultTickets),
    "LIST",
    ["Default tickets", "Ticket count the mission starts with"],
    ["TF47 Framework", "Ticketsystem"],
    [[100, 150, 200, 250, 300, 350, 400], [], 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxTickets),
    "LIST",
    ["Max tickets", "Maximal amount of tickets allowed at every given time"],
    ["TF47 Framework", "Ticketsystem"],
    [[100, 150, 200], [], 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(endSession),
    "CHECKBOX",
    ["End session", "Ends a session if no more tickets are available"],
    ["TF47 Framework", "Ticketsystem"],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(endSessionTimeout),
    "LIST",
    ["Timeout befor session end", "Timeout before the session ends"],
    ["TF47 Framework", "Ticketsystem"],
    [[30, 60, 90, 120, 150, 180, 210], [], 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(logToDatabase),
    "CHECKBOX",
    ["Log to database", "logs the ticketchange to the database"],
    ["TF47 Framework", "Ticketsystem"],
    true,
    1
] call CBA_fnc_addSetting;

LOG("TF47 tracking preInit completed!");
