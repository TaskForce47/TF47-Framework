class CfgFunctions 
{
    class ADDON
    {
        class ticketsystem
        {
            file = "\tf47\tf47_framework\addons\ticketsystem\functions";
            class changeTickets {};
            class getTicketCost {};
            class handleUnitKilled {};
            class handleVehicleKilled {};
            class initClient { postInit = 1; };
            class initServer { postInit = 1; };
            class loadTicketsFromProfile {};
            class registerUnit {};
            class registerVehicle {};
            class saveTicketsToProfile {};
            class unregisterVehicle {};
            //class settings { preInit = 1; };
        };
    };
};