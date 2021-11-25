/// @description Follow a character!

image_alpha = !hidden;

if (follow != noone) {
	x = follow.x;
	y = follow.y;
}

if controlled {
	//Move it!
	if keyboard_check_pressed(vk_left) {
		x -= 16;
	}
	
	if keyboard_check_pressed(vk_right) {
		x += 16;
	}
	
	if keyboard_check_pressed(vk_up) {
		y -= 16;
	}
	
	if keyboard_check_pressed(vk_down) {
		y += 16;
	}
	
	//Get hovered object
	hover = instance_place(x,y,obj_token_pm_queue);
	/*
	if place_meeting(x,y,obj_token_pm) {
		with obj_token_pm {
			if place_meeting(x,y,obj_ret) {obj_ret.hover = id}
		}
	}
	*/
}