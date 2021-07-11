#include "macros.hpp"

params [
    ["_ticketCount", 0, [0]],
    ["_resetTickets", false, [true]]
];

EXEC_ONLY_SERVER;

if (_ticketCount <= 0 || _resetTickets) then {
    _ticketCount = -1;
};

profileNamespace setVariable [format ["%1_%2", QGVAR(savedTickets), worldName], _ticketCount];
saveProfileNamespace;