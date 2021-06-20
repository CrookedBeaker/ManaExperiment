/// @description Continue!

if (canStart && keyboard_check_pressed(vk_enter)) {
	canStart = false;
	
	timeline_index = tln_start;
	timeline_position = 0;
	timeline_running = true;
}