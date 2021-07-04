#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {};
        author = "TF47 Dragon";
        VERSION_CONFIG;
    };
};

#include "CfgFunctions.hpp"

class Extended_PreInit_EventHandlers 
{
    class ADDON 
    {
        init = QUOTE(call preprocessFileLineNumbers ""\tf47\tf47_framework\addons\ticketsystem\XEH_preInit"");
    };
};
