///////////////////////////////////
//  Jonipetteri SPAWNER		     //
///////////////////////////////////

//---------------------------------------------------------------------------------------------------------------------------------------------------------

//ENEMY SPAWNER (enemymenu)

_action = ["enemyAction", "Spawn enemies", "", {}, {}] call ace_interact_menu_fnc_createAction;         // Creating action to ace menu
[enemymenu, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;    			// Add action when ace menu item is selected

_action = ["enemySubAction","Area 1","",{[0, [], {hint "Spawned."; call JPS_fnc_createEnemy;}, {hint "Canceled.";}, "Working..."] call ace_common_fnc_progressBar;}, {true}] call ace_interact_menu_fnc_createAction;
[enemymenu, 0, ["ACE_MainActions", "enemyAction"], _action] call ace_interact_menu_fnc_addActionToObject;


//VEHICLE SPAWNER (vehiclemenu)

_wheeledVeh1 = "B_Truck_01_covered_F";
_wheeledVeh2 = "B_Truck_01_fuel_F";
_wheeledVeh3 = "B_Truck_01_medical_F";
_wheeledVeh4 = "B_Truck_01_Repair_F";


_action = ["vehicleAction", "Wheeled", "", {}, {}] call ace_interact_menu_fnc_createAction;           		// Creating action to ace menu
[vehiclemenu, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;    			// Add action when ace menu item is selected

// Submenu: Veh1
_action = ["vehicleSubAction","Spawn vehicle","",{
	[0, [], {_wheeledVeh1 createVehicle getPos wheeledSpot; hint "Spawned.";}, {hint "Canceled.";}, "Working..."] call ace_common_fnc_progressBar;},
	{true}] call ace_interact_menu_fnc_createAction;
[vehiclemenu, 0, ["ACE_MainActions", "vehicleAction"], _action] call ace_interact_menu_fnc_addActionToObject;

// Submenu: Veh2
_action = ["vehicleSubAction","Spawn vehicle","",{
	[0, [], {_wheeledVeh2 createVehicle getPos wheeledSpot; hint "Spawned.";}, {hint "Canceled.";}, "Working..."] call ace_common_fnc_progressBar;},
	{true}] call ace_interact_menu_fnc_createAction;
[vehiclemenu, 0, ["ACE_MainActions", "vehicleAction"], _action] call ace_interact_menu_fnc_addActionToObject;

// Submenu: Veh3
_action = ["vehicleSubAction","Spawn vehicle","",{
	[0, [], {_wheeledVeh3 createVehicle getPos wheeledSpot; hint "Spawned.";}, {hint "Canceled.";}, "Working..."] call ace_common_fnc_progressBar;},
	{true}] call ace_interact_menu_fnc_createAction;
[vehiclemenu, 0, ["ACE_MainActions", "vehicleAction"], _action] call ace_interact_menu_fnc_addActionToObject;

// Submenu: Veh4
_action = ["vehicleSubAction","Spawn vehicle","",{
	[0, [], {_wheeledVeh4 createVehicle getPos wheeledSpot; hint "Spawned.";}, {hint "Canceled.";}, "Working..."] call ace_common_fnc_progressBar;},
	{true}] call ace_interact_menu_fnc_createAction;
[vehiclemenu, 0, ["ACE_MainActions", "vehicleAction"], _action] call ace_interact_menu_fnc_addActionToObject;
