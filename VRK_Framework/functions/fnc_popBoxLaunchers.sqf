
VRK_fnc_popBoxLaunchers = {
	params["_box", "_era", "_intPlayers"];

	_arrBoxItems = [
	];

	// Add certain items only for selected factions/eras
	switch (_era) do {
		case "Fin95":  { _arrBoxItems pushBack [["Item_rhs_weap_m72a7", 	_intPlayers],["launch_NLAW_F", 	_intPlayers]]; };
		case "NATO90": { _arrBoxItems pushBack [["Item_rhs_weap_m72a7", 	_intPlayers],["launch_NLAW_F", 	_intPlayers]]; };
		case "FinWW2": { _arrBoxItems pushBack [["rhs_weap_panzerfaust60", 	_intPlayers]]; };
	};

	// Populate boxes
	{
		_box addItemCargoGlobal [(_x #0), (_x #1)];
		
	} forEach _arrBoxItems;

};
