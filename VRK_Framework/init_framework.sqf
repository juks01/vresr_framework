/*

VResR Script Framework
	-comment / uncomment all CALL lines you want/don't want to use

	Contributors: JukS, Lion, Prisoner, Marccanen
	VResR Discord: 1.VResR (Arma III)
	VResK Discord:   VResK (Arma III)
*/

#include "CONFIG.sqf"


if(VRK_Framework_Debug > 0) then {		["=== VResK Framework initializing... ==="] remoteExec ["systemChat", [0, -2] select isDedicated];	};


// Iterate through scripts array defined in CONFIG.sqf
{
	call compile preprocessFileLineNumbers _x;
} forEach arrVRKScripts;


// Keep this on the bottom
if(VRK_Framework_Debug > 0) then {		["=== VResK Framework initialized ==="] remoteExec ["systemChat", [0, -2] select isDedicated];	};
