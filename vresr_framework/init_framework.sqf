/*

VResR Script Framework
	-comment / uncomment all CALL lines you want/don't want to use

	Contributors: JukS, Lion, Prisoner, Marccanen
	VResR Discord: 1.VResR (Arma III)
	VResK Discord:   VResK (Arma III)
*/

VRR_Framework_Debug = 1;			// 1 = enable debugging
publicVariable "VRR_Framework_Debug";
if(VRR_Framework_Debug > 0) then {		["=== VResR Framework initializing... ==="] remoteExec ["systemChat", [0, -2] select isDedicated];	};


// Include here initalization of all script parts
call compile preprocessFileLineNumbers "vresr_framework\functions\fnc_Spawner.sqf";
call compile preprocessFileLineNumbers "vresr_framework\functions\fnc_addGroup.sqf";
call compile preprocessFileLineNumbers "vresr_framework\functions\fnc_addVehicle.sqf";


// Keep this on the bottom
if(VRR_Framework_Debug > 0) then {		["=== VResR Framework initialized ==="] remoteExec ["systemChat", [0, -2] select isDedicated];	};
