/// @description Check in on a party member!

// Inherit the parent event
event_inherited();

//Overwrite a few functions
function SetMenu(menuID) {
	var l = [];
	
	switch menuID {
		case 0:
			var l = (character.ss != 0) ? ["Equipment","Magic","Back"] : ["Equipment","Back"];
			break;
		case 1:
			var l = ["Back"];
	}
	
	MakeMenu(l,menuID,false);
	//Overwrite this function to add menu builds
}

function Select() {
	switch menuID {
		case 0:
			switch index { //Main
				case 0: //Get equipment
					SetMenu(1);
					break;
				case 1: //Magic/Back
					if (character.ss != 0) {
						MakeSpellsMenu(character,0);
					} else {
						instance_destroy();
					}
					break;
				case 2: //Back
					instance_destroy();
			}
			break;
		case 1: //Equipment
			SetMenu(0);
	}
	//Overwrite this function to add functionality
}