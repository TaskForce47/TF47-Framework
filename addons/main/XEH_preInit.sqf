#include "script_component.hpp"

[
    QEGVAR(common,missionType),
    "LIST",
    ["Sets the mission type", ""],
    ["TF47 Framework", "Core"],
    [["COOP", "PVP"], [], 0],
    1,
    nil,
    true
] call CBA_fnc_addSetting;

[
    QEGVAR(common,missionId),
    "SLIDER",
    ["Sets the mission id", ""],
    ["TF47 Framework", "Core"],
    [0, 100, 1, 0],
    1,
    nil,
    true
] call CBA_fnc_addSetting;

[
    QEGVAR(base,enableBaseProtection),
    "CHECKBOX",
    ["Enable Base protection", "Enables or disables the base protection"],
    ["TF47 Framework", "Basesystem"],
    true,
    1
] call CBA_fnc_addSetting;

[
    QEGVAR(base,removeFiredProjectiles),
    "CHECKBOX",
    ["Prevent firing in base", "Removes fired projectiles fired inside the base"],
    ["TF47 Framework", "Basesystem"],
    true,
    1
] call CBA_fnc_addSetting;

[
    QEGVAR(base,kickOnBaseShooting),
    "CHECKBOX",
    ["Kick on base shooting", "Enables or disables kicking of players who are shooting inside the base"],
    ["TF47 Framework", "Basesystem"],
    true,
    1
] call CBA_fnc_addSetting;


LOG("TF47 common preInit completed!");


ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;
