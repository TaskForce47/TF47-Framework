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