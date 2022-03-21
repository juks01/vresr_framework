/*

VFF_fnc_addGroup - function to add groups
	-leader and one static grunt is added by default.
	-if more than 2 enemies wanted, they will be randomized

	Parameters:
	_units			INTEGER			number of units to spawn in one group
	_target			ARRAY[x,y,z]	position where to spawn enemies
	_classes		ARRAY[strings]	array of unit class names to randomly fulfill the group
	_staticLeaders	ARRAY[strings]	array of unit leader class names
	_staticGrunt	STRING			class name of static soldier
	_side			SIDE			side of the group (east, west, ...)

*/


VRR_fnc_addGroup = {
	params ["_units", "_target", "_classes", "_staticLeaders", "_staticGrunt", "_side"];

	_group = createGroup _side;
	if(count _staticLeaders > 0) then {												// If leader array is defined
		_group createUnit [selectRandom _staticLeaders, _target, [], 3, "NONE"];		//Lisätään SL tai TL
	};
	if(!isNil _staticGrunt) then {															// If static soldier is defined
	_group createUnit [_staticGrunt, _target, [], 3, "NONE"];							//Lisätään rifleman
	};

	// Add some randomness if more than 2 units in a group
	if(_units > 2) then {
		fixedUnits = round random [_units-2, _units-1, _units+1];
	} else {
		fixedUnits = 0;
	};

	// spawn units to group
	for [{private _i = 0}, {_i < fixedUnits}, {_i = _i + 1}] do {
		[_group, _classes, _target] spawn {
			params ["_group", "_classes", "_target"];
			_group createUnit [selectRandom _classes, _target, [], 3, "NONE"];
		};
	};

	_group;		// return group (might be needed in future)

};


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



// Keep this on the bottom
if(VRR_Framework_Debug > 0) then {		["--fnc_addGroup loaded"] remoteExec ["systemChat", [0, -2] select isDedicated];	};
