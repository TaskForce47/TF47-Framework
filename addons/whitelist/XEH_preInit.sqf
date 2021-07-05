#include "script_component.hpp"

LOG("TF47 Whitelist running preInit");

[
    QGVAR(enableWhitelist),
    "CHECKBOX",
    ["Enable Whitelist", "Enables or disables the whitelist system"],
    ["TF47 Framework", "Whitelist"],
    true,
    1
] call CBA_fnc_addSetting;

LOG("TF47 Whitelist preInit completed!");