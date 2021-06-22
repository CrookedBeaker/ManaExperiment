/// @description Be the main menu

// Inherit the parent event
event_inherited();

//Overwrite a few functions
function SetMenu(menuID) {
	var l = [];
	
	switch menuID {
		case 0: //Main
			var l = ["Party","Battle","Quit"];
			break;
		case 1: //Sub - Party
			var l = ["Players","NPCs","Back"];
			break;
		case 2: //Sub - Battle
			var l = ["Back"];
			break;
	}
	
	MakeMenu(l,menuID,false);
}

function Select() {
	switch menuID {
		case 0: //Main
			
			switch index {
				case 0: //Party
					MakeSubMenu(1);
					break;
				case 1: //Party
					MakeSubMenu(2);
					break;
				case 2: //Quit
					game_end();
			}
			break;
		
		case 1: //Sub - Party
			
			switch index {
				case 0: //Main
					room_goto(rm_party_pc);
					break;
				case 1: //NPCs
					room_goto(rm_party_npc);
					break;
				case 2: //Back
					instance_destroy();
			}
			break;
			
		case 2: //Sub - Battle
			
			switch index {
				case 0: //Back
					instance_destroy();
			}
			break;
	}
	//Overwrite this function to add functionality
}