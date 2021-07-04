#include "macros.hpp"

[
    QGVAR(enableWhitelist),
    "CHECKBOX",
    ["Enable Whitelist", "Enables or disables the whitelist system"],
    ["TF47", "Whitelist"],
    true,
    1,
    nil,
    true
] call CBA_fnc_addSettings;

LOG("TF47 Whitelist settings loaded!");