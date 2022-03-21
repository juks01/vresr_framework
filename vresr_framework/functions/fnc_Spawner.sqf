/*

VRR_fnc_Spawner - main function to spawn units (groups) and vehicles

	Parameters:
	None

*/

VRR_fnc_Spawner = {
	arrEnemyClasses = ["O_Soldier_F", "O_Soldier_AR_F", "O_medic_F", "O_engineer_F", "O_Soldier_GL_F", "O_soldier_M_F", "O_soldier_exp_F", "O_Soldier_AA_F", "O_Soldier_AT_F" ];
	arrVehiclesLightArmored = [ "O_LSV_02_armed_F", "O_LSV_02_unarmed_F", "" ];

	intGroupsSelector = 1;
	intGroupSize = 3;
<<<<<<< HEAD
	sideWanted = east;

	intOmaAsetus = 1;

	switch (intGroupsSelector) do {
		case 1: { intGroups = 7  + (round random 8); };		// 7-15 groups
		case 2: { intGroups = 15 + (round random 10); };	// 15-25 groups
		case 3: { intGroups = 25 + (round random 10); };	// 25-35 groups
		default { intGroups = 7  + (round random 8); };
	};

	// Generate groups
	_unitStaticLeaders = ["O_Soldier_SL_F", "O_Soldier_TL_F", "O_officer_F"];
	_unitGrunt = "O_Soldier_F";
	for [{private _j = 0}, {_j < intGroups}, {_j = _j + 1}] do {
		_marker = enemyArea1;
		_radius = 100;
		_targetPos = (getPos _marker) getPos [random(_radius), random(360)];
		_group = [intGroupSize, _targetPos, arrEnemyClasses, _unitStaticLeaders, _unitGrunt, sideWanted] call VRR_fnc_addGroup;
		[_group, _targetPos, 100] call BIS_fnc_taskPatrol;
	};

};


// arrEnemyClasses = [ "O_G_Soldier_F", "O_G_Soldier_AR_F", "O_G_medic_F", "O_G_Soldier_LAT_F", "O_G_Soldier_TL_F", "O_G_Soldier_F", "O_G_Soldier_F" ];

//	_unitStaticLeaders = ["O_G_Soldier_SL_F", "O_G_Soldier_TL_F"];
//	_unitGrunt = "O_G_Soldier_F";

//		_wp = _group addWaypoint [position selectRandom _arrBaseTargets, 0]; 					// TODO TARGET
//		_wp setWaypointType "SAD";



// Keep this on the bottom
if(VRR_Framework_Debug > 0) then {		["-fnc_Spawner loaded"] remoteExec ["systemChat", [0, -2] select isDedicated];	};
