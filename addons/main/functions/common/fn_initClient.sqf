#include "macros.hpp"
if (isDedicated || !hasInterface) exitWith {};

// Skip the briefing by pressing the continue button on behalf of the user
// http://killzonekid.com/arma-scripting-tutorials-how-to-skip-briefing-screen-in-mp/

0 spawn {
    if (!isNumber (missionConfigFile >> "briefing")) exitWith {};
    if (getNumber (missionConfigFile >> "briefing") == 1) exitWith {};

    private _displayIdd = getNumber (configFile >> (["RscDisplayClientGetReady", "RscDisplayServerGetReady"] select (isServer)) >> "idd");
    waitUntil {
        if (getClientStateNumber >= 10) exitWith {true};

        disableSerialization;
        private _display = findDisplay _displayIdd;
        if (!isNull _display) exitWith {
            ctrlActivate (_display displayCtrl 1);
            _display closeDisplay 1;
            true
        };
        false
    };
};