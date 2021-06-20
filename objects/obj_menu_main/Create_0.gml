/// @description Insert description here
// You can write your code in this editor

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
					show_debug_message("Not made yet lol");
					break;
				case 1: //NPCs
					show_debug_message("Not made yet lol");
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