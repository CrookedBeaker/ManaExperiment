/// @description Set up some stuff

function MakeMenu(labelArray,menuID,big) { //Generate a menu
	
	for (var i=0; i<array_length(labelArray); i++) { //Make each button and put it in an array
		buttons[i] = instance_create_depth(x,y-16-16*i,depth,obj_menubutton);
		buttons[i].index = array_length(labelArray)-i-1;
		buttons[i].label = labelArray[array_length(labelArray)-i-1];
		buttons[i].par = id;
	}
	
	id.menuID = menuID;
}

MakeMenu(["Sample","Sample","Sample"],0,false); //Test