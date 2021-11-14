/// @description Go side to side!

// Inherit the parent event
event_inherited();

if !hide {

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

} else {
	
	//Unhide if not hidden this frame
	if ((keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter)) && prevHide) {
		Show();
	}
	
}

prevHide = hide; //Hidden on previous frame?