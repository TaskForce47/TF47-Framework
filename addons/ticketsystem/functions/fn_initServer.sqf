#include "macros.hpp"

if (!isServer) exitWith {};
if (!GVAR(enableTicketsystem)) exitWith {};

GVAR(tickets) = call FUNC(loadTicketsFromProfile);
publicVariable QGVAR(tickets);
GVAR(registeredVehicles) = createHashMap;
GVAR(registeredUnits) = createHashMap;
GVAR(vehicleTicketCosts) = createHashMap;

addMissionEventHandler ["HandleDisconnect", {
    params ["_unit", "_id", "_uid", "_name"];

    private _slotName = str _unit;
    private _data = GVAR(registeredUnits) getOrDefault [_slotName, []];
    if (_data isEqualTo []) exitWith {}; //unit is not registered, cancel at this point
    if (_unit call ace_medical_status_fnc_hasStableVitals) exitWith {};

    private _cost = _data select 1;
    private _message = format ["A %1 disconnected in an unstable state. We lost %2 tickets!", _data select 2, _cost];

    [_cost, false, _message, _ui1d] call FUNC(changeTickets);

    false //this must return false otherwise unit becomes ai
}];

if (GVAR(endSession)) then {
    [
        EVENT(outOfTickets),
        {
            if (missionNamespace getVariable [QGVAR(suddenDeath), false]) exitWith {};

            ["TF47NotificationOutOfTickets", [format ["We have run out of tickets, you have %1 seconds to gain some before the game is over!", GVAR(endSessionTimeout)]]] 
                remoteExec ["BIS_fnc_showNotification", -2];
            ["Alarm"] remoteExec ["playSound", -2];

            missionNamespace setVariable [QGVAR(suddenDeath), true];
            [
                {
                    if (GVAR(tickets) > 0) then {
                        [
                            ["Success! We got a few tickets back and are back in business!", 2, 0, 6]
                        ] remoteExec ["BIS_fnc_EXP_camp_SITREP", 0];
                        missionNamespace setVariable [QGVAR(suddenDeath), false];
                    } else {
                        ["TF47NotificationOutOfTickets", ["We have run out of tickets, mission failed!"]] remoteExec ["BIS_fnc_showNotification", -2];
                        [
                            { "EveryoneLost" call BIS_fnc_endMissionServer; },
                            5
                        ] call CBA_fnc_waitAndExecute;
                    };
                },
                nil,
                GVAR(endSessionTimeout)
            ] call CBA_fnc_waitAndExecute;
        }
    ] call CBA_fnc_addEventhandler;
};

[
    "AllVehicles",
    "init",
    {
        params ["_vehicle"];
        
        private _data = GVAR(vehicleTicketCosts) getOrDefault [typeOf _vehicle, []];
        if (_data isEqualTo []) exitWith {};

        [_vehicle, _data] call FUNC(registerVehicle);
    },
    true,
    [],
    true
] call CBA_fnc_addClassEventhandler;

missionNamespace setVariable [QGVAR(initialized), true, true];