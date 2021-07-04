#include "macros.hpp"
if (!hasInterface && !isDedicated) exitWith {};
if (!GVAR(enableTicketsystem)) exitWith {};

//handles the animation for displaying the cost of a vehicle on entering
player addEventHandler ["GetInMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];

    if (!(_vehicle getVariable [QGVAR(registered), false])) exitWith {};

    [
        ["Entered a vehicle!",2, 0, 6],
        [format ["Type: %1", [_vehicle] call EFUNC(common,getVehicleDisplayName)], 2, 0, 6],
        [format ["This vehicle costs %1 tickets.", _vehicle getVariable [QGVAR(cost), 0]], 2, 0, 6]
    ] spawn BIS_fnc_EXP_camp_SITREP;
}];

//handles the ticket loss for units killed
player addEventHandler ["Killed", {
    _this remoteExecCall [QFUNC(handleUnitKilled), 2];
}];

[
    "changeTickets", 
    {
        private _tickets = parseNumber (_this select 0);
        private _message = "Admin ticket change!";
        private _adminUid = getPlayerUid player;

        if (_tickets > 0) then {
            [_tickets, true, _message, _adminUid] remoteExecCall [QFUNC(changeTickets), 2];
        } else {
            [(_tickets * -1), false, _message, _adminUid] remoteExecCall [QFUNC(changeTickets), 2];
        };
    },
    "admin"
] call CBA_fnc_registerChatCommand;

[
    EVENT(ticketsChanged),
    {
        params ["_ticketChange", "_newTickets", "_message"];
        hint format ["New Ticket count: %1", _newTickets];

        if (_ticketChange > 0) then {
            [
                "TF47NotificationTicketGain",
                [_message]
            ] call BIS_fnc_showNotification;
        } else {
            [
                "TF47NotificationTicketLoss",
                [_message]
            ] call BIS_fnc_showNotification;
        };

        
    }
] call CBA_fnc_addEventhandler;

