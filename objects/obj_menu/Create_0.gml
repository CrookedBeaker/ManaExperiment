/// @description Set up some stuff

function MakeMenu(labelArray,menuID,big) { //Generate a menu
	//Remove existing buttons
	for (var i=0; i<array_length(buttons); i++) {
		instance_destroy(buttons[i])
	}
	buttons = [];
	
	for (var i=0; i<array_length(labelArray); i++) { //Make each button and put it in an array
		buttons[i] = instance_create_depth(x,y-16-16*i,depth,obj_menubutton);
		buttons[i].index = array_length(labelArray)-i-1;
		buttons[i].label = labelArray[array_length(labelArray)-i-1];
		buttons[i].par = id;
	}
	
	id.menuID = menuID;
}

function MakeSubMenu(menuID) { //Generate a sub-menu
	sub = instance_create_depth(x+16,y,depth-1,object_index);
	sub.par = id;
	
	with sub {
		SetMenu(menuID);
	}
}

function SetMenu(menuID) {
	var l = [];
	
	switch menuID {
		case 0:
			var l = ["Sample","Sample","Sample"];
	}
	
	MakeMenu(l,menuID,false);
	//Overwrite this function to add menu builds
}

function Select() {
	switch menuID {
		default:
			switch index {
				default:
					show_debug_message("Selected an option.");
			}
	}
	//Overwrite this function to add functionality
}

//MakeMenu(["Sample","Sample","Sample"],0,false); //Test