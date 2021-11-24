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
	
	MakeMenu(l,menuID,true);
}

function Select() {
	switch menuID {
		case 0: //Main
			
			switch index {
				case 0: //Move
					if (par.movedTurn < par.move) {
						par.Move();
						instance_destroy();
					}
					break;
				case 1: //Action
					if par.action {MakeSubMenu(1)};
					break;
				case 2: //Bonus Action
					if par.baction {MakeSubMenu(2)};
					break;
				case 3: //End turn.
					par.movedTurn = 0;
					par.action = true;
					par.baction = true;
					instance_destroy();
					//with obj_dm {
					with obj_dm_queue {
						//NextTurn();
						//nextTurn();
						turnOver = true;
					}
			}
			break;
		
		case 1: //Sub - Action
			
			switch index {
				case 0: //Attack
					par.par.Attack();
					instance_destroy();
					instance_destroy(par);
					break;
				case 1: //Dash
					par.par.Dash();
					instance_destroy();
					break;
				case 2: //Disengage
					par.par.Disengage();
					instance_destroy();
					break;
				case 3: //Dodge
					par.par.Dodge();
					instance_destroy();
					break;
				case 4: //Spells
					
					break;
				case 5: //Back
					instance_destroy();
			}
			break;
			
		case 2: //Sub - Bonus Action
			
			switch index {
				case 0: //Back
					instance_destroy();
			}
			break;
	}
}