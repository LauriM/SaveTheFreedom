if(not isServer) exitWith{};

// Set primary area

// # TODO #
// randomize weather
// add civilians to cities
// Add list of targets where the target area is chosen
// spawn couple of vehicles somehow
// add random shit to the map
// enemy counts from parameters
// add briefing

//todo: "getPos target" for item

_list = position player nearObjects ["House", 99999999];

_count = count _list;

 _target= _list call BIS_fnc_selectRandom;

// move the area markers to the area
"targetArea" setMarkerPos getPos _target;
"largeTargetArea" setMarkerPos getPos _target;
"closeTargetArea" setMarkerPos getPos _target;

// spawn the patrol squad to the area
nul=[theofficer,"closeTargetArea","random","trigger"] execVM "ups.sqf";
nul=[patrol,"targetArea","random","trigger","min:",6,"max:",10] execVM "ups.sqf";
nul=[largepatrol,"largeTargetArea","random","trigger", "min:",3,"max:",3] execVM "ups.sqf";

// move visual marker to target
"targetAreaVisual" setMarkerPos getMarkerPos("targetArea");

// add a "end trigger" for the officer
theofficer addEventHandler ["Killed",
{
systemChat "officer dead, get intel, extract from the area";
}];

systemChat "Chiper init";
systemChat format["Total of %1 houses", _count];
