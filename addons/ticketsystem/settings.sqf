[
    QGVAR(enableTicketsystem),
    "CHECKBOX",
    "Enable Ticketsystem",
    ["TF47", "Ticketsystem"],
    true,
    1,
    {},
    true
] call CBA_fnc_addSettings;

[
    QGVAR(defaultTickets),
    "LIST",
    "Default tickets",
    ["TF47", "Ticketsystem"],
    [[100, 150, 200], ["100", "150", "200"], 0],
    1
] call CBA_fnc_addSettings;

[
    QGVAR(maxTickets),
    "LIST",
    "Max tickets",
    ["TF47", "Ticketsystem"],
    [[100, 150, 200], ["100", "150", "200"], 0],
    1
] call CBA_fnc_addSettings;

[
    QGVAR(endSession),
    "CHECKBOX",
    "End session when no tickets remaining"
    ["TF47", "Ticketsystem"],
    true,
    1
] call CBA_fnc_addSettings;

[
    QGVAR(endSessionTimeout),
    "SLIDER",
    "Timeout befor session end",
    ["TF47", "Ticketsystem"],
    [0, 600, 60, 0, true],
    1
] call CBA_fnc_addSettings;

[
    QGVAR(logToDatabasea),
    "List",
    "Log to database",
    ["TF47", "Ticketsystem"],
    true,
    1
] call CBA_fnc_addSettings;
