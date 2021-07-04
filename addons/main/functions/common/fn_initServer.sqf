#include "macros.hpp"

if(!isServer) exitWith {};


EFUNC(prism,createPlayer) = compileFinal "params [""_playerUid"", ""_playerName""]; TF47PrismCreatePlayer [_playerUid, _playerName];";
EFUNC(prism,updateTicketCount) = compileFinal "params [""_ticketChange"", ""_ticketCount"", ""_message"", ""_playerUid""]; TF47PrismUpdateTicketCount [_ticketChange, _ticketCount, _message, _playerUid];";
EFUNC(prism,getWhitelist) = compileFinal "params [""_playerUid"", ""_callbackCode""]; TF47PrismGetWhitelist [_playerUid, _callbackCode];";

addMissionEventHandler ["PlayerConnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

    if(_name isEqualTo "__SERVER__") exitWith {};
    if(["HC", _uid] call BIS_fnc_inString) exitWith {};

    [_uid, _name] call EFUNC(prism,createPlayer);
}]