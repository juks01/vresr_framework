/*

VRK_fnc_rationsSpeed - function to adjust thirst and hunger
	-this function can be used to increase hunger and thirst accumuluation
	-their range is 0 (fine) to 100 ("dead") - status critical at ~95
	-basically one can count 100 - _accumulation/1min = "death"

	Parameters:
	_accumulation		FLOAT		Amount of increase on every 60sec)		Default: 3

	Example:
	5 call VRK_fnc_rationsSpeed;	= Roughly ~19 minutes to get in problems

*/

VRK_fnc_rationsSpeed = {
	{
		params ["_accumulation"];
		[_x, _accumulation] spawn {
			params["_x", "_accumulation"];

			_origValue = 0.02777778;	// ACE default
			_floatIncrement = 3;		// base value
			if(_accumulation > 0 && _accumulation < 50) then {
				_floatIncrement = _accumulation;
			};

			while {true} do {
				_hunger = _x getVariable "acex_field_rations_hunger";
				_thirst = _x getVariable "acex_field_rations_thirst";
				if(_hunger + _floatIncrement/2 < 95) then {
					_x setVariable ["acex_field_rations_hunger", _hunger + _floatIncrement/2 , true];
				};
				if(_thirst + _floatIncrement < 95) then {
					_x setVariable ["acex_field_rations_thirst", _thirst + _floatIncrement, true];
				};
				sleep 60;
			};
		};
	} forEach AllPlayers;
};


// Keep this on the bottom
if(VRK_Framework_Debug > 0) then {		["-fnc_rationsSpeed loaded"] remoteExec ["systemChat", [0, -2] select isDedicated];	};
