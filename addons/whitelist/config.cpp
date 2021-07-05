#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tf47f_main", "cba_settings"};
        author = "TF47 Dragon";
        VERSION_CONFIG;
    };
};

#include "CfgFunctions.hpp"

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = "call compile preprocessFileLineNumbers '\tf47\tf47_framework\addons\whitelist\XEH_preInit.sqf';";
    };
};
