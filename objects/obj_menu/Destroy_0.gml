/// @description Gone.

//Unlink from main menu if possible
if (par != noone) {
	par.sub = noone;
}

//Remove buttons
for (var i=0; i<array_length(buttons); i++) {
	instance_destroy(buttons[i]);
}