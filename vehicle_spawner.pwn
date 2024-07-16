#include <a_samp>

#define CARS_DIALOG_ID 1
#define CAR_SPAWN_DISTANCE 5

new car_ids [] = {
    400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414,
    415, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429,
    430, 431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444,
    445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459,
    460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474,
    475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489,
    490, 491, 492, 493, 494, 495, 496, 497, 498, 499, 500, 501, 502, 503, 504,
    505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519,
    520, 521, 522, 523, 524, 525, 526, 527, 528, 529, 530, 531, 532, 533, 534,
    535, 536, 537, 538, 539, 540, 541, 542, 543, 544, 545, 546, 547, 548, 549,
    550, 551, 552, 553, 554, 555, 556, 557, 558, 559, 560, 561, 562, 563, 564,
    565, 566, 567, 568, 569, 570, 571, 572, 573, 574, 575, 576, 577, 578, 579,
    580, 581, 582, 583, 584, 585, 586, 587, 588, 589, 590, 591, 592, 593, 594,
    595, 596, 597, 598, 599, 600, 601, 602, 603, 604, 605, 606, 607, 608, 609,
    610, 611
};

new car_names [] [] = {
    "Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel", "Dumper",
    "Firetruck", "Trashmaster", "Stretch", "Manana", "Infernus", "Voodoo", "Pony", "Mule",
    "Cheetah", "Ambulance", "Leviathan", "Moonbeam", "Esperanto", "Taxi", "Washington",
    "Bobcat", "Mr Whoopee", "BF Injection", "Hunter", "Premier", "Enforcer", "Securicar",
    "Banshee", "Predator", "Bus", "Rhino", "Barracks", "Hotknife", "Trailer 1", "Previon",
    "Coach", "Cabbie", "Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster",
    "Admiral", "Squalo", "Seasparrow", "Pizzaboy", "Tram", "Trailer 2", "Turismo",
    "Speeder", "Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair", "Berkley's RC Van",
    "Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale", "Oceanic",
    "Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy", "Hermes", "Sabre",
    "Rustler", "ZR-350", "Walton", "Regina", "Comet", "BMX", "Burrito", "Camper", "Marquis",
    "Baggage", "Dozer", "Maverick", "News Chopper", "Rancher", "FBI Rancher", "Virgo", "Greenwood",
    "Jetmax", "Hotring", "Sandking", "Blista Compact", "Police Maverick", "Boxville", "Benson",
    "Mesa", "RC Goblin", "Hotring Racer A", "Hotring Racer B", "Bloodring Banger", "Rancher",
    "Super GT", "Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropdust", "Stunt",
    "Tanker", "Roadtrain", "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra", "FCR-900",
    "NRG-500", "HPV1000", "Cement Truck", "Tow Truck", "Fortune", "Cadrona", "FBI Truck",
    "Willard", "Forklift", "Tractor", "Combine", "Feltzer", "Remington", "Slamvan",
    "Blade", "Freight", "Streak", "Vortex", "Vincent", "Bullet", "Clover", "Sadler",
    "Firetruck LA", "Hustler", "Intruder", "Primo", "Cargobob", "Tampa", "Sunrise", "Merit",
    "Utility", "Nevada", "Yosemite", "Windsor", "Monster A", "Monster B", "Uranus", "Jester",
    "Sultan", "Stratum", "Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna",
    "Bandito", "Freight Flat", "Streak Carriage", "Kart", "Mower", "Duneride", "Sweeper",
    "Broadway", "Tornado", "AT-400", "DFT-30", "Huntley", "Stafford", "BF-400", "Newsvan",
    "Tug", "Trailer 3", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club", "Freight Carriage",
    "Trailer 3", "Andromada", "Dodo", "RC Cam", "Launch", "Police Car (LSPD)", "Police Car (SFPD)",
    "Police Car (LVPD)", "Police Ranger", "Picador", "S.W.A.T. Van", "Alpha", "Phoenix", "Glendale",
    "Sadler", "Luggage Trailer A", "Luggage Trailer B", "Stair Trailer", "Boxville", "Farm Plow",
    "Utility Trailer"
}

new big_car_string [10240];

public OnFilterScriptInit() {

    for (new i = 0; i < sizeof(car_ids); ++i) {

        strcat(big_car_string, car_names[i]);
        strcat(big_car_string, "\n");

    }

    return 1;

}

public OnPlayerCommandText(playerid, cmdtext[]) {

    if (!strcmp(cmdtext, "/veiculos", true)) {

        ShowPlayerDialog(
            playerid, CARS_DIALOG_ID, DIALOG_STYLE_LIST,
            "Selecione seu carro",
            big_car_string,
            "Selecionar", "Sair"
        );

    }

    if(strcmp(cmdtext, "/limpar", true) == 0) {
          new vehicleid = GetPlayerVehicleID(playerid);
          DestroyVehicle(vehicleid);

    }

    return 1;

}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

    new Float:player_x, Float:player_y, Float:player_z, Float:player_angle;

    if (dialogid == CARS_DIALOG_ID) {

        if (response) {
            GetPlayerPos(playerid, Float:player_x, Float:player_y, Float:player_z);
            GetPlayerFacingAngle(playerid, Float:player_angle);
            CreateVehicle(
                car_ids[listitem],
                player_x + CAR_SPAWN_DISTANCE * floatcos(90 + player_angle, degrees),
                player_y + CAR_SPAWN_DISTANCE * floatsin(90 - player_angle, degrees),
                player_z + 2.0,
                player_angle + 90.0,
                -1, -1, 5000
            );
        }

        return 1;
    }

    return 0;

}
