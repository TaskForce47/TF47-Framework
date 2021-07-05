#include "macros.hpp"

if (isDedicated || !hasInterface) exitWith {};

GVAR(uavList) = [];

player addEventHandler ["SeatSwitchedMan", {
    params ["_unit1", "_unit2", "_vehicle"];
    if (([_unit2] call CBA_fnc_vehicleRole) isEqualTo "cargo") exitWith {};
    [_unit2, _vehicle] remoteExecCall [QFUNC(handleRoleCheck), 2];
}];

player addEventHandler ["GetInMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];
    if (_role isEqualTo "cargo") exitWith {};
    [_unit, _vehicle] remoteExecCall [QFUNC(handleRoleCheck), 2];
}];

[
    { !isNull player },
    {
        [
            { !isNil QGVAR(initialized) },
            {
                [player] remoteExecCall [QFUNC(handleSlotCheck), 2];
            },
            nil,
            10,
            {
                if (isServer) exitWith {}; //player mission editor
                [player, "Could not get whitelist! Please report to an admin."] call FUNC(kickToLobby);
            }
        ] call CBA_fnc_waitUntilAndExecute;

        [
            {
                [
                    "",
                    "init",
                    {
                        params ["_vehicle"];
                        if (!unitIsUAV _vehicle) exitWith {};
                        if (player getUnitTrait ROLE_UAV_SMALL || 
                            player getUnitTrait ROLE_UAV_LARGE) exitWith {};
                        
                        player disableUAVConnectability [_vehicle, true];
                        GVAR(uav) pushBackUnique _vehicle;
                        //cleanup uav list
                        _vehicle addEventHandler ["Killed", {
                            params ["_drone"];
                            GVAR(index) deleteAt (GVAR(uav) findIf { _x isEqualTo _drone });
                        }];
                    },
                    true,
                    [],
                    true
                ] call CBA_fnc_addClassEventHandler;
            },
            nil,
            5
        ] call CBA_fnc_waitAndExecute;
    }
] call CBA_fnc_waitUntilAndExecute;

player addEventHandler ["Take", {
    params ["_unit", "_container", "_item"];

    if ((([_item] call BIS_fnc_itemType) select 1) isNotEqualTo "UAVTerminal") exitWith {};

    if (player getUnitTrait ROLE_UAV_SMALL || 
        player getUnitTrait ROLE_UAV_LARGE) then {
        {
            if (!isNull _x) then {
                player enableUAVConnectability [_x, true];
            };
        } foreach GVAR(uavList);
    } else {
        {
            if (!isNull _x) then {
                player disableUAVConnectability [_x, true];
            };
        } foreach GVAR(uavList);
    };
}];
