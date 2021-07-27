#include "macros.hpp"

if (!isServer) exitWith {};

GVAR(ownerLockupTable) = createHashMap;
GVAR(slotRequiredPermissions) = createHashMap;
GVAR(slotRoles) = createHashMap;

publicVariable QGVAR(slotRoles);

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

GVAR(ignoreList) = [];

addMissionEventHandler ["PlayerConnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

    if(_name isEqualTo "__SERVER__") exitWith {};
    if(["HC", _uid] call BIS_fnc_inString) exitWith {};
    GVAR(ownerLockupTable) set [_uid, _owner];
    "tf47_prism_sharp" callExtension ["getPlayerPermissions", [_uid]];
}];

addMissionEventHandler ["ExtensionCallback", {
    params ["_name", "_function", "_data"];
    if (_name isNotEqualTo "TF47PrismSharp") exitWith {};

    switch _function do {
        case "TF47PrismWhitelistUpdate": {
            private _data = parseSimpleArray _data;
            _data params ["_playerUid", "_permissions"];

            GVAR(permissionCache) set [_playerUid, _permissions];

            _owner = GVAR(ownerLockupTable) getOrDefault [_uid, []];
            if (_owner isNotEqualTo []) then {
                GVAR(ownerLockupTable) deleteAt _uid;
                GVAR(initialized) = true;
                _owner publicVariableClient QGVAR(initialized);
            };
        };
    };
}];

//update the whitelist for all players every few min
[
    {
        private _players = call CBA_fnc_players;
        {
            "tf47_prism_sharp" callExtension ["getPlayerPermissions", [getPlayerUID _x]];
        } forEach _players;
    },
    62
] call CBA_fnc_addPerFrameHandler;

missionNamespace setVariable [QGVAR(initialized), true];

true
