class CfgFunctions 
{
    class TF47_common
    {
        class common 
        {
            file = "\tf47\tf47_framework\addons\main\functions\common";
            class crashToDesktop {};
            class getVehicleDisplayName {};
            class initClient { preInit = 1; };
            class initServer { postInit = 1; };
        };
    };
    class TF47_Base
    {
        class base 
        {
            file = "\tf47\tf47_framework\addons\main\functions\base";
            class initClient { postInit = 1; };
            class initServer { postInit = 1; };
            class registerBase {};
            class unregisterBase {};
        }
    };
};