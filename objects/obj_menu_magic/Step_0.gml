/// @description Go side to side!

// Inherit the parent event
event_inherited();

//Scroll
if keyboard_check_pressed(vk_right) {
	menuID++;
	
	if (menuID > 1) {menuID = 0};
	SetMenu(menuID);
}

if keyboard_check_pressed(vk_left) {
	menuID--;
	
	if (menuID < 0) {menuID = 1};
	SetMenu(menuID);
}