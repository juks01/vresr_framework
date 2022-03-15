///////////////////////////////////
//  Jonipetteri SPAWNER		     //
///////////////////////////////////

JPS_fnc_createEnemy = {
	_unitCount = 2;
	_unitStatic = ["O_G_Soldier_SL_F", "O_G_Soldier_TL_F"];
	_unitGrunt = "O_G_Soldier_F";
	_unitGroups = [
		["O_G_Sharpshooter_F", "O_G_Sharpshooter_F", "O_G_Sharpshooter_F", "O_G_Sharpshooter_F"],	
		["O_G_Soldier_AR_F", "O_G_Soldier_AR_F", "O_G_Soldier_AR_F", "O_G_Soldier_AR_F"],
		["O_G_Soldier_LAT_F", "O_G_Soldier_LAT_F", "O_G_Soldier_LAT_F", "O_G_Soldier_LAT_F"]
		];
	_spawnPos1 = enemyArea1;
	_group = createGroup [east, true];
	_staticClass = selectRandom _unitStatic;
	_classes = selectRandom _unitGroups;															//Lukitaan unitGroupsista yksi rivi
	_group createUnit [_staticClass, getPos _spawnPos1, [], 3, "NONE"];								//Lisätään SL tai TL
	_group createUnit [_unitGrunt, getPos _spawnPos1, [], 3, "NONE"];								//Lisätään rifleman
	_unitCount = round random [_unitCount -1,_unitCount + 1, _unitCount + 5];
	for [{_i = 0}, {_i < _unitCount}, {_i = _i + 1}] do {
		_group createUnit [selectRandom _classes, getPos _spawnPos1, [], 3, "NONE"];
	};
	[_group, getPos enemyArea1, 100] call BIS_fnc_taskPatrol;
};


//	["O_G_Soldier_AR_F","O_G_Soldier_M_F","O_G_Soldier_LAT_F","O_G_Sharpshooter_F"]
//	["O_G_Soldier_SL_F", "O_G_Soldier_TL_F"]
//	["O_G_Soldier_F"]