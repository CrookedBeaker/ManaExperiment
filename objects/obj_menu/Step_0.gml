/// @description Select de bitch

if (par = noone) {

if keyboard_check_pressed(vk_down) {
	index++;
	
	if (index >= array_length(buttons)) {index = 0};
}

if keyboard_check_pressed(vk_up) {
	index--;
	
	if (index < 0) {index = array_length(buttons)-1};
}

}