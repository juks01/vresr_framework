/*

VRR_fnc_addVehicle - function to add vehicles with crew

	Parameters:
	_vehicleslightarmored	ARRAY[strings]		array of vehicle class names to randomly add
	_targets				ARRAY[objects]		array of objects where to spawn the vehicle
	_arrBaseTargets			ARRAY[objects]		array of objects where to put target waypoint

*/


VRR_fnc_addVehicle = {
	params ["_vehicleslightarmored", "_targets", "_arrBaseTargets"];

	private _veh = createVehicle [selectRandom _vehicleslightarmored, position selectRandom _targets, [], 20, "NONE"];
	private _grp = createVehicleCrew _veh;

	// TODO: Select vehicle crew from (?) or from _enemies?
	// private _grp = group commander _veh;	
	
	private _wp = _grp addWaypoint [position selectRandom _arrBaseTargets, 0];
	_wp setWaypointType "SAD";		// Seek and destroy

};


// Keep this on the bottom
if(VRR_Framework_Debug > 0) then {		["--fnc_addVehicle loaded"] remoteExec ["systemChat", [0, -2] select isDedicated];		};
