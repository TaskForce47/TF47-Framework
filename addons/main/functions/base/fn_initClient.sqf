#include "macros.hpp"

if (isDedicated && !hasInterface) exitWith {};

missionNamespace setVariable [QGVAR(inBase), false];

[
    { !isNull player },
    {
        [
            {
                if (player isNotEqualTo objectParent player) exitWith {
                    if (GVAR(inBase)) then {
                        [EVENT(leftBase), nil] call CBA_fnc_localEvent;
                    };
                };
                {
                    private _posPlayer = getPos player;
                    switch (_x select 2) do {
                        case "POLYGON": {
                            if (_posPlayer inPolygon (_x select 1)) then {
                                if (!GVAR(inBase)) exitWith {
                                    GVAR(inBase) = true;
                                    [EVENT(enteredBase), nil] call CBA_fnc_localEvent;
                                };
                            };
                        };
                        case "MARKER": {
                            if (_posPlayer inArea (_x select 1)) then {
                                if (!GVAR(inBase)) exitWith {
                                    GVAR(inBase) = true;
                                    [EVENT(enteredBase), nil] call CBA_fnc_localEvent;
                                }
                            };
                        };
                    };
                } foreach GVAR(baseList);

                if (GVAR(inBase)) exitWith {
                    GVAR(inBase) = false;
                    [EVENT(leftBase), nil] call CBA_fnc_localEvent;
                };
            },
            5
        ] call CBA_fnc_addPerFrameHandler;
    }
] call CBA_fnc_waitUntilAndExecute;

if (GVAR(enableBaseProtection)) then {
    [
        EVENT(enteredBase), 
        {
            player allowDamage false;
            playSound "Alarm";
            playSound "Alarm";
            [
                format ["You have entered FOB %1", mapGridPosition player],
                format ["Time: %1%2", date select 3, date select 4],
                "You are now invulnerable!",
                ""
            ] spawn BIS_fnc_infoText;
        }
    ] call CBA_fnc_addEventhandler;

    [
        EVENT(leftBase), 
        {
            player allowDamage true;
            playSound "Alarm";
            [
                format ["You have left FOB %1", mapGridPosition player],
                format ["Time: %1%2", date select 3, date select 4],
                "You are now vulnerable!",
                ""
            ] spawn BIS_fnc_infoText;
        }
    ] call CBA_fnc_addEventhandler;
};

if (GVAR(removeFiredProjectiles)) then {
    [
        EVENT(enteredBase),
        {
            private _id = player addEventHandler ["Fired", {
                deleteVehicle (_this select 6);
                private _message = format ["<t color='#ff4c33'>Shooting inside the base is not allowed!</t>"];
                cutText [_message, "PLAIN DOWN", -1, true, true];
                
                if (GVAR(kickOnBaseShooting)) then {
                    hint "Stop shooting immediately or you will be kicked!";
                    private _lastTimeShot = player getVariable [QGVAR(lastTimeShot), CBA_missionTime];

                    if ((CBA_missionTime - _lastTimeShot) > 10) then {
                        player setVariable [QGVAR(shotsInBase), 1];
                    } else {
                        private _shotsInBase = (player getVariable [QGVAR(shotsInBase), 0]) + 1;
                        player setVariable [QGVAR(lastTimeShot), CBA_missionTime];
                        if (_shotsInBase >= GVAR(maxShotCount)) then {
                            ["BaseShooting", false] call BIS_fnc_endMission;
                        };
                        player setVariable [QGVAR(shotsInBase), _shotsInBase];
                    };
                };
            }];
            player setVariable [QGVAR(baseFiredId), _id];
        }
    ] call CBA_fnc_addEventHandler;

    [
        EVENT(leftBase),
        {
            player removeEventHandler ["Fired", player getVariable [QGVAR(baseFiredId), -1]];
            player setVariable [QGVAR(baseFiredId), -1];
        }
    ] call CBA_fnc_addEventHandler;
};