/*

VRK_fnc_addVehicle - function to add vehicles with crew

	Parameters:
	_arrVehicleTypes	ARRAY[strings]		array of vehicle class names to randomly add
	_target				ARRAY[objects]		array of objects where to spawn the vehicle
	_objWPTarget		ARRAY[objects]		array of objects where to put target waypoint

*/


VRK_fnc_addVehicle = {
	params ["_arrVehicleTypes", "_target", "_objWPTarget"];

	private _veh = createVehicle [selectRandom _arrVehicleTypes, _target, [], 20, "NONE"];
	private _grp = createVehicleCrew _veh;

	// TODO: Select vehicle crew from (?) or from _enemies?
	// private _grp = group commander _veh;	
	
	private _wp = _grp addWaypoint [_objWPTarget, 0];
	_wp setWaypointType "SAD";		// Seek and Destroy

};


// Keep this on the bottom
if(VRK_Framework_Debug > 0) then {		["--fnc_addVehicle loaded"] remoteExec ["systemChat", [0, -2] select isDedicated];		};
