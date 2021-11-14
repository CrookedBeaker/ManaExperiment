/// @description Select de bitch

if (menuID == -1) {SetMenu(0)};

if (sub == noone && !hide) {

//Scroll
if keyboard_check_pressed(vk_down) {
	index++;
	
	if (index >= array_length(buttons)) {index = 0};
}

if keyboard_check_pressed(vk_up) {
	index--;
	
	if (index < 0) {index = array_length(buttons)-1};
}

//Select
if keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter) {
	Select();
}

}