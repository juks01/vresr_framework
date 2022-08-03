
VRK_fnc_popBoxMedical = {
	params["_box", "_era", "_intPlayers"];

	_intBandages = VRK_intBandagesBase + VRK_intBandagesMultiplier * _intPlayers + VRK_intMedics * 4;

	_arrBoxItems = [
		["ACE_fieldDressing", 		_intBandages],
		["ACE_elasticBandage", 		_intBandages],
		["ACE_tourniquet", 			VRK_intMedics * 4 + _intPlayers * 2],
		["ACE_splint", 				VRK_intMedics * 2 + _intPlayers],
		["ACE_morphine", 			VRK_intMedics * 4 + _intPlayers * 2],
		["ACE_epinephrine", 		VRK_intMedics * 4],
		["ACE_salineIV", 			VRK_intMedics * 2],
		["ACE_salineIV_500", 		VRK_intMedics * 4],
		["ACE_salineIV_250", 		VRK_intMedics * 4],
		["ACE_personalAidKit", 		VRK_intMedics],
		["ACE_surgicalKit", 		VRK_intMedics],
		["ACE_bodyBag", 			3 + _intPlayers]
	];

	// Add certain items only for selected factions/eras
	switch (_era) do {
		case "Fin95":  { _arrBoxItems pushBack [["ACE_quikclot", 			_intBandages],["ACE_packingBandage", 		_intBandages]]; };
		case "NATO90": { _arrBoxItems pushBack [["ACE_quikclot", 			_intBandages],["ACE_packingBandage", 		_intBandages]]; };
	};

	// Populate boxes
	{ _box addItemCargoGlobal [(_x #0), (_x #1)]; } forEach _arrBoxItems;

};
