
_headlessClients = entities "HeadlessClient_F";
_humanPlayers = allPlayers - _headlessClients;
_intPlayers = count _humanPlayers;

VRK_intEra = "Fin95";			// TODO: define in Parameters


// Populate boxes
{
	_box = _x;
	switch true do {
		case ("ACE_medicalSupplyCrate" in typeOf _box): {
			[_box, VRK_intEra, _intPlayers] call VRK_fnc_popBoxMedical;
		};
		case ("Box_NATO_Wps_F" in typeOf _box): {
		};
		case ("Box_NATO_WpsLaunch_F" in typeOf _box): {
			[_box, VRK_intEra, _intPlayers] call VRK_fnc_popBoxLaunchers;
		};
		case ("Box_NATO_WpsSpecial_F" in typeOf _box): {
		};
		case ("Box_NATO_Grenades_F" in typeOf _box): {
		};
		case ("Box_NATO_Support_F" in typeOf _box): {
			[_box, VRK_intEra, _intPlayers] call VRK_fnc_popBoxSupport;
		};
	};
} forEach ([0,0] nearSupplies 20000);






/*
	clearBackpackCargoGlobal _box;
	clearMagazineCargoGlobal _box;
	clearWeaponCargoGlobal _box;
	clearItemCargoGlobal _box;
*/
