#include "macros.hpp"

GVAR(slotRequiredPermissions) = createHashMap;
GVAR(slotRoles) = createHashMap;
GVAR(permissionCache) = createHashMap;
GVAR(attackAircraft) = [];
GVAR(validRoles) = [
    "TF47_role_tank_crew",
    "TF47_role_plane_transport_crew",
    "TF47_role_plane_transport_pilot",
    "TF47_role_plane_attack_pilot",
    "TF47_role_plane_attack_crew",
    "TF47_role_rotary_transport_crew",
    "TF47_role_rotary_transport_pilot",
    "TF47_role_rotary_attack_pilot",
    "TF47_role_rotary_attack_crew",
    "TF47_role_uav_small",
    "TF47_role_uav_large"
];

addMissionEventHandler ["PlayerConnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
    [
        _uid,
        {
            params ["_playerUid", "_permissions"];

            GVAR(permissionCache) set [_playerUid, _permissions];
        }
    ] call EFUNC(prism,getWhitelist);
}];

[
    {
        private _players = call CBA_fnc_players;
        {
            [
                getPlayerUID _x,
                {
                    params ["_playerUid", "_permissions"];

                    GVAR(permissionCache) set [_playerUid, _permissions];
                }
            ] call EFUNC(prism,getWhitelist);
        } forEach _players;
    },
    62
] call CBA_fnc_addPerFrameHandler;