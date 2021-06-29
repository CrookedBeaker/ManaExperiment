/// @description Take your turn, adventurer!

// Inherit the parent event
event_inherited();

//Overwrite a few functions
function SetMenu(menuID) {
	var l = [];
	
	switch menuID {
		case 0: //Main
			var l = ["Move","Action","Bonus Ac.","End Turn"];
			break;
		case 1: //Sub - Action
			var l = ["Attack","Dash","Disengage","Dodge","Spells","Back"];
			break;
		case 2: //Sub - Bonus Action
			var l = ["Back"];
			break;
	}
	
	MakeMenu(l,menuID,false);
}

function Select() {
	switch menuID {
		case 0: //Main
			
			switch index {
				case 0: //Move
					par.Move();
					instance_destroy();
					break;
				case 1: //Action
					MakeSubMenu(1);
					break;
				case 2: //Bonus Action
					MakeSubMenu(2);
					break;
			}
			break;
		
		case 1: //Sub - Party
			
			switch index {
				case 0: //Attack
					
					break;
				case 1: //Dash
					
					break;
				case 2: //Disengage
					
					break;
				case 3: //Dodge
					
					break;
				case 4: //Spells
					
					break;
				case 5: //Back
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