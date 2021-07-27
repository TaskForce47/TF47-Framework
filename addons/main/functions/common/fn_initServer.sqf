#include "macros.hpp"

if(!isServer) exitWith {};

//prevent execution on local sp
if (isServer && !hasInterface) then {
    [
        {
            GVAR(sessionId) = "tf47_prism_sharp" callExtension ["createSession", [worldName, EGVAR(common,missionType), EGVAR(common,missionId)]];
            publicVariable QGVAR(sessionId);
        },
        nil,
        5
    ] call CBA_fnc_waitAndExecute;
};

addMissionEventHandler ["PlayerConnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

    if(_name isEqualTo "__SERVER__") exitWith {};
    if(["HC", _uid] call BIS_fnc_inString) exitWith {};

    "tf47_prism_sharp" callExtension ["createPlayer", [_uid, _name]];
}];