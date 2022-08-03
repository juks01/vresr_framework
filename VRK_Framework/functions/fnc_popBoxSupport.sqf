
VRK_fnc_popBoxSupport = {
	params["_box", "_era", "_intPlayers"];

	_intLeaders = 1 + floor(_intPlayers /3);

	_arrBoxItems = [
		["ACE_MapTools",			_intLeaders],
		["ACE_Canteen", 			_intPlayers * 2],
		["ACE_SpareBarrel_Item",	2 + _intLeaders],
		["ACE_CableTie",			10 + _intPlayers / 4]
	];


	// Add food of random type with some probabilities
	_arrFoods = ["ACE_MRE_LambCurry", "ACE_MRE_BeefStew", "ACE_MRE_CreamTomatoSoup", "ACE_MRE_CreamChickenSoup", "ACE_MRE_ChickenTikkaMasala", "ACE_MRE_SteakVegetables", "ACE_MRE_MeatballsPasta", "ACE_MRE_ChickenHerbDumplings"];
	for "_i" from 0 to _intPlayers do {
		_food = selectRandom _arrFoods;
		_arrBoxItems pushBack [_food, 			1];
	};


	// Add certain items only for selected factions/eras
	switch (_era) do {
		case "Fin95":  { 	_arrBoxItems pushBack 	["ACE_Flashlight_XL50", 		_intPlayers];
							_arrBoxItems pushBack 	["ACE_EarPlugs",				_intPlayers];
							_arrBoxItems pushBack 	["ACRE_PRC148",					_intPlayers];
							_arrBoxItems pushBack 	["ACE_Vector",					_intLeaders];
		};
		case "NATO90": { 	_arrBoxItems pushBack 	["ACE_Flashlight_XL50", 		_intPlayers];
							_arrBoxItems pushBack 	["ACE_EarPlugs",				_intPlayers];
							_arrBoxItems pushBack 	["ACRE_PRC152",					_intPlayers];
							_arrBoxItems pushBack 	["ACE_Vector",					_intLeaders];
		};
		case "FinWW2": {
							_arrBoxItems pushBack 	["rhs_weap_panzerfaust60", 		_intPlayers];
		};
	};


	// Populate boxes
	{
		_box addItemCargoGlobal [(_x #0), (_x #1)];
		
	} forEach _arrBoxItems;

};
