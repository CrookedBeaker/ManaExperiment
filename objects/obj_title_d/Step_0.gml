/// @description Continue!

if (canStart && keyboard_check_pressed(vk_enter)) {
	canStart = false;
	
	timeline_index = tln_start;
	timeline_position = 0;
	timeline_running = true;
}

if keyboard_check_pressed(vk_enter) && sprite_index = spr_title_d_shine {
	image_speed = 1;
}