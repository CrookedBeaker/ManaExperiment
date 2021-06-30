/// @description Do things!
if !firstFrame {

switch actionTaking { //Handle everything here
	
case 0: //Moving!
	obj_ret.follow = noone;
	obj_ret.x = -16;
	obj_ret.y = -16;
	
	if keyboard_check_pressed(vk_left) && (moved < move || moveOrigin[0] < x) && !place_meeting(x-16,y,obj_solid) {
		x -= 16;
	}
	
	if keyboard_check_pressed(vk_right) && (moved < move || moveOrigin[0] > x) && !place_meeting(x+16,y,obj_solid) {
		x += 16;
	}
	
	if keyboard_check_pressed(vk_up) && (moved < move || moveOrigin[1] < y) && !place_meeting(x,y-16,obj_solid) {
		y -= 16;
	}
	
	if keyboard_check_pressed(vk_down) && (moved < move || moveOrigin[1] > y) && !place_meeting(x,y+16,obj_solid) {
		y += 16;
	}
	
	if keyboard_check_pressed(ord("X")) { //Snap back to original position
		x = moveOrigin[0];
		y = moveOrigin[1];
		actionTaking = -1;
		firstFrame = true;
		TakeTurn();
	}
	
	if keyboard_check_pressed(ord("Z")) { //Confirm movement
		movedTurn += moved;
		actionTaking = -1;
		firstFrame = true;
		TakeTurn();
	}
	
	moved = (abs(x-moveOrigin[0])+abs(y-moveOrigin[1]))/16 + movedTurn;
	break;
	
case 1: //Attacking!
	if keyboard_check_pressed(ord("X")) { //Get that out of here
		actionTaking = -1;
		firstFrame = true;
		TakeTurn();
	}
	
	if keyboard_check_pressed(ord("Z")) { //Confirm attack?
		obj_dm.Attack(id,obj_ret.hover);
		actionTaking = -1;
		firstFrame = true;
		action = false;
		TakeTurn();
	}
	break;
}

} else {
	firstFrame = (actionTaking = -1);
}