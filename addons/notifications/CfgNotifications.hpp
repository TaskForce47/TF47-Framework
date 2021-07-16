class CfgNotifications;
class CfgNotifications : CfgNotifications
{
    class TF47Notification {
        title = "";
        iconPicture = "";
        iconText = "";
        description = "%1";
        color[] = {1,1,1,1};
        duration = 5;
        priority = 0;
        difficulty[] = {};
    };

    class TF47NotificationTicketLoss : TF47Notification {
        title = "Ticket loss";
        iconPicture = "z\TF47\addons\mission_configs\data\icons\tickets_loss.paa";
        description = "%1";
    };

    class TF47NotificationTicketGain : TF47Notification {
        title = "Ticket gain";
        iconPicture = "z\TF47\addons\mission_configs\data\icons\tickets_gain.paa";
        description = "%1";
    };

    class TF47NotificationOutOfTickets : TF47Notification {
        title = "No tickets remaining";
        iconPicture = "z\TF47\addons\mission_configs\data\icons\tickets_lost.paa";
        description = "%1";
    };

    class TF47NotificationNotWhitelisted : TF47Notification {
        title = "Not whitelisted";
        iconPicture = "z\TF47\addons\mission_configs\data\icons\wrong_slot.paa";
        description = "%1";
    };

    class TF47NotificationBadWeapon : TF47Notification {
        title = "You are not allowed to carry that weapon";
        iconPicture = "z\TF47\addons\mission_configs\data\icons\bad_weapon.paa";
        description = "%1";
    };
};