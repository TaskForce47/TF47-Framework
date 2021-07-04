#define COMPONENT whitelist
#include "\tf47\tf47_framework\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_DATABASE
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_DATABASE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_DATABASE
#endif

#include "\tf47\tf47_framework\addons\main\script_macros.hpp"

#define ROLE_TANK_CREW "TF47_role_tank_crew"
#define ROLE_PLANE_TRANSPORT_CREW "TF47_role_plane_transport_crew"
#define ROLE_PLANE_TRANSPORT_PILOT "TF47_role_plane_transport_pilot"
#define ROLE_PLANE_ATTACK_PILOT "TF47_role_plane_attack_pilot"
#define ROLE_PLANE_ATTACK_CREW "TF47_role_plane_attack_crew"
#define ROLE_ROTARY_TRANSPORT_CREW "TF47_role_rotary_transport_crew"
#define ROLE_ROTARY_TRANSPORT_PILOT "TF47_role_rotary_transport_pilot"
#define ROLE_ROTARY_ATTACK_PILOT "TF47_role_rotary_attack_pilot"
#define ROLE_ROTARY_ATTACK_CREW "TF47_role_rotary_attack_crew"
#define ROLE_UAV_SMALL "TF47_role_uav_small"
#define ROLE_UAV_LARGE "TF47_role_uav_large"