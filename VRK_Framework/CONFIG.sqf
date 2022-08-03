/*

VResK Framework main config file

*/

// Enable debug messages
VRK_Framework_Debug = 1;			// 1 = enable debugging



// 		DEFAULT VALUES

// Unit spawner
VRK_intMedics = 2;
VRK_intBandagesBase = 4;
VRK_intBandagesMultiplier = 4;

//		/DEFAULT VALUES



// Activated scripts and their descriptions
arrVRKScripts = [

	"VRK_Framework\functions\fnc_addGroup.sqf",			// Sub function to spawn an unit
	"VRK_Framework\functions\fnc_addVehicle.sqf",		// Sub function to spawn a vehicle
	"VRK_Framework\functions\fnc_Spawner.sqf",			// Main function to spawn units (groups) and vehicles

	"VRK_Framework\functions\fnc_popBoxMedical.sqf",	// Sub function for automatically adding stuff to boxes
	"VRK_Framework\functions\fnc_popBoxLaunchers.sqf",	// Sub function for automatically adding stuff to boxes
	"VRK_Framework\functions\fnc_popBoxSupport.sqf",	// Sub function for automatically adding stuff to boxes
	"VRK_Framework\functions\fnc_popBoxes.sqf",			// Main function for automatically adding stuff to boxes

//	"VRK_Framework\functions\fnc_SANLA.sqf",			// Sanomalaite M90

//	"VRK_Framework\functions\fnc_IED.sqf"				// IED automation

//	"VRK_Framework\functions\fnc_AdminPanel.sqf"		// TODO: Admin panel

	"VRK_Framework\functions\fnc_rationsSpeed.sqf"		// Adjust water and food consumption

];



