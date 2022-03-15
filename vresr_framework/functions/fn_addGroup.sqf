
						["--addGroup loaded"] remoteExec ["systemChat", [0, -2] select isDedicated];

params ["_wave", "_enemies", "_targets", "_classes", "_arrBaseTargets"];

// Add some randomness if more than 2 enemies in a group
if(_enemies > 2) then {
	fixedEnemies = selectRandom [_enemies-1, _enemies, _enemies+1];
} else {
	fixedEnemies = _enemies;
};

_group = createGroup east;
_pos = position selectRandom _targets;

// spawn enemies to group
for [{private _i = 0}, {_i < fixedEnemies}, {_i = _i + 1}] do {
	_group createUnit [selectRandom _classes, _pos, [], 50, "NONE"];
};

_wp = _group addWaypoint [position selectRandom _arrBaseTargets, 0];
_wp setWaypointType "SAD";







// SIIRRÄ OMAAN FUNKTIOTIEDOSTOON
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