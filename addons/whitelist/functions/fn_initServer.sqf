#include "macros.hpp"

GVAR(ownerLockupTable) = createHashMap;
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

    if(_name isEqualTo "__SERVER__") exitWith {};
    if(["HC", _uid] call BIS_fnc_inString) exitWith {};
    GVAR(ownerLockupTable) set [_uid, _owner];
    [
        _uid,
        {
            params ["_playerUid", "_permissions"];

            GVAR(permissionCache) set [_playerUid, _permissions];
            private _owner = GVAR(ownerLockupTable) getOrDefault [_playerUid, -1];
            if (_owner == -1) exitWith {
                ERROR("FAILED TO LOOKUP USERS OWNERID FROM PLAYERUID! COULD NOT INITALIZE WHITELIST FOR THIS PLAYER");
            };
            //this will message the client that he can now use the whitelist
            GVAR(initialized) = true;
            _owner publicVariableClient QGVAR(initialized);
        }
    ] call EFUNC(prism,getWhitelist);
}];

//update the whitelist for all players every few min
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