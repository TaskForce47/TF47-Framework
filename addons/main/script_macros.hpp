#include "\z\ace\addons\main\script_macros.hpp"
#include "\x\cba\addons\main\script_macros_common.hpp"
#define DFUNC(var1) TRIPLES(ADDON,fnc,var1)
#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fn,fncName).sqf)
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fn,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif

#define EVENT(var1) QEGVAR(event,var1)
#define EXEC_ONLY_UNSCHEDULED if (canSuspend) exitWith { LOG("WARNING: " + _fnc_scriptName + " was called in SCHEDULED Enviroment from "+ _fnc_scriptNameParent); [missionNamespace getVariable _fnc_scriptName, _this] call CBA_fnc_directCall;}
