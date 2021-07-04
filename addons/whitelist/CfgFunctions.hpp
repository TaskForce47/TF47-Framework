class CfgFunctions 
{
    class ADDON
    {
        class whitelist
        {
            file = "\tf47\tf47_framework\addons\whitelist\functions";
            class checkRoles {};
            class checkWhitelistSlot {};
            class handleRoleCheck {};
            class handleSlotCheck {};
            class initPlayer { postInit = 1; };
            class initServer { postInit = 1; };
            class initSlotRoles {};
            class isValidVehicle {};
            class kickFromVehicle {};
            class kickToLobby {};
            class registerRoles {};
            class registerSlotWhitelist {};
        };
    };
};