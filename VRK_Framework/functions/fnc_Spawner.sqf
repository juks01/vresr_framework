/*

VRK_fnc_Spawner - main function to spawn units (groups) and vehicles

	Parameters: None

*/

VRK_fnc_Spawner = {
	params ["_intUnitsSelector"];

	_arrEnemyClasses = ["O_Soldier_F", "O_Soldier_AR_F", "O_medic_F", "O_engineer_F", "O_Soldier_GL_F", "O_soldier_M_F", "O_soldier_exp_F", "O_Soldier_AA_F", "O_Soldier_AT_F" ];
	_arrVehicles = [ "O_LSV_02_armed_F", "O_LSV_02_unarmed_F", "" ];

	_intGroupSize = 3;
	_sideWanted = east;
	_intVehicles = 2;

	switch (_intUnitsSelector) do {
		case 1: { _intUnits = 7  + (round random 8); };		// 7-15 units
		case 2: { _intUnits = 15 + (round random 10); };	// 15-25 units
		case 3: { _intUnits = 25 + (round random 10); };	// 25-35 units
		default { _intUnits = 7  + (round random 8); };
	};

	// Generate groups
	_unitStaticLeaders = ["O_Soldier_SL_F", "O_Soldier_TL_F", "O_officer_F"];
	_unitGrunt = "O_Soldier_F";
	for [{private _i = 0}, {_i < _intUnits}, {_i = _i + 1}] do {
		_marker = enemyArea1;
		_radius = 100;
		_targetPos = (getPos _marker) getPos [random(_radius), random(360)];
		_group = [_intGroupSize, _targetPos, _arrEnemyClasses, _unitStaticLeaders, _unitGrunt, _sideWanted] call VRK_fnc_addGroup;
		[_group, _targetPos, 100] call BIS_fnc_taskPatrol;
	};

	// Generate vehicles
	for [{private _i = 0}, {_i < _intVehicles}, {_i = _i + 1}] do {
		_marker = enemyArea1;
		_radius = 100;
		_targetPos = (getPos _marker) getPos [random(_radius), random(360)];
		_veh = [_arrVehicles, _targetPos, _targetPos] call VRK_fnc_addVehicle;

	};
};


// TODO: Waypoint definition

//		_wp = _group addWaypoint [position selectRandom _arrBaseTargets, 0]; 					// TODO TARGET
//		_wp setWaypointType "SAD";



// Keep this on the bottom
if(VRK_Framework_Debug > 0) then {		["-fnc_Spawner loaded"] remoteExec ["systemChat", [0, -2] select isDedicated];	};
