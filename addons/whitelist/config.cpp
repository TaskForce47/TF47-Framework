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

class Extended_PreInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_preInitClient));
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};
