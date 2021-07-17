#include "script_component.hpp"

class CfgPatches {
    class tf47f_main {
        name = COMPONENT;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main"};
        author = "TF47 Dragon";
        VERSION_CONFIG;
    };
};

#include "CfgFunctions.hpp"

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = "call compile preprocessFileLineNumbers '\tf47\tf47_framework\addons\main\XEH_preInit.sqf';";
    };
};
