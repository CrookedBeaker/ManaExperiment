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
	if (room != rm_party_pc && room != rm_party_npc) { //Actual use in combat
	
		switch buttons[array_length(buttons)-index-1].label {
			case "Back":
				instance_destroy();
				break;
			
		}
	
	} else { //Viewing these spells in the party listing by hiding
		if (index == array_length(buttons)-1) {
			instance_destroy();
		} else {
			Hide();
		}
	}
}

//Because I have to apparently, I'm putting this here.
function Hide() {
	hide = true;
	
	for (var i = 0; i < array_length(buttons); i++) {
		buttons[i].hide = true;
	}
	
	if (sub != noone) {
		if !sub.hide {
			with sub {Hide()};
		}
	}
	if (par != noone) {
		if !par.hide {
			with par {Hide()};
		}
	}
}

function Show() {
	hide = false;
	
	for (var i = 0; i < array_length(buttons); i++) {
		buttons[i].hide = false;
	}
	
	if (sub != noone) {
		if sub.hide {
			with sub {Show()};
		}
	}
	if (par != noone) {
		if par.hide {
			with par {Show()};
		}
	}
}

