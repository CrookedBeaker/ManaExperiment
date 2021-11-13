/// @description Get some magic!

function buildSpellArray(lvl) {
	var a = ["None"];
	
	switch spellLen {
		case 0: //All spells
			
			//Append the lists
			a = character.spellsA[lvl];
			var oldLen = array_length(a);
			for (var i = oldLen; i < oldLen+array_length(character.spellsBA[lvl]); i++) {
				a[i] = character.spellsBA[lvl][i-oldLen];
			}
			
			//Check if the array contains any extra Nones and weed them out
			for (var i = 0; i < array_length(a); i++) {
				if (a[i] == "None" && array_length(a) != 1) {
					array_delete(a,i,1);
					i--;
				}
			}
			break;
		case 1: //Only action
			a = character.spellsA[lvl];
			break;
		case 2: //Only bonus action
			a = character.spellsBA[lvl];
			break;
	}
	a[array_length(a)] = "Back";
	
	return a;
}

// Inherit the parent event
event_inherited();

//Overwrite a few functions
function SetMenu(menuID) {
	var l = buildSpellArray(menuID);
	index = 0;
	MakeMenu(l,menuID,true);
}

function Select() {
	switch buttons[array_length(buttons)-index-1].label {
		case "Back":
			instance_destroy();
			break;
		
	}
	/*
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
				case 0: //Test
					room_goto(rm_battle);
					break;
				case 1: //Back
					instance_destroy();
			}
			break;
	}
	*/
	//Overwrite this function to add functionality
}