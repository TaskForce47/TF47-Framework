#include "macros.hpp"

params [
    ["_baseIndex", -1, [0]]
];

EXEC_ONLY_SERVER;
EXEC_ONLY_UNSCHEDULED;


if (_baseIndex isEqualTo -1) exitWith { false };

GVAR(baseList) deleteAt GVAR(baseList) findIf { (_x select 0) isEqualTo _baseIndex };
publicVariable QGVAR(baseList);

true