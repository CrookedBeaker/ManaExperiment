/// @description Do things!
if !firstFrame {

switch actionTaking { //Handle everything here
	
case 0: //Moving!
	obj_ret.follow = noone;
	obj_ret.x = -16;
	obj_ret.y = -16;
	
	var tMove = (spAction = 1) ? move*2 : move;
	
	if keyboard_check_pressed(vk_left) && (moved < tMove || moveOrigin[0] < x) && !place_meeting(x-16,y,obj_solid) {
		x -= 16;
	}
	
	if keyboard_check_pressed(vk_right) && (moved < tMove || moveOrigin[0] > x) && !place_meeting(x+16,y,obj_solid) {
		x += 16;
	}
	
	if keyboard_check_pressed(vk_up) && (moved < tMove || moveOrigin[1] < y) && !place_meeting(x,y-16,obj_solid) {
		y -= 16;
	}
	
	if keyboard_check_pressed(vk_down) && (moved < tMove || moveOrigin[1] > y) && !place_meeting(x,y+16,obj_solid) {
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
		//Potentially provoke opportunity attacks
		if (spAction != 2) {
			var i = moveOrigin;
			var j = id;
			with obj_token_pm { //Placeholder
				if (distance_to_point(i[0],i[1]) < 32 && distance_to_point(j.x,j.y) > 16 && j != id) {
					queueLog(character.name+" strikes with opportunity!");
					queueAttack(id,j);
				}
			}
		}
		
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
		queueTurnResume();
	}
	
	if keyboard_check_pressed(ord("Z")) { //Confirm attack?
		action = false;
		queueAttack(id,obj_ret.hover);
		actionTaking = -1;
		firstFrame = true;
		queueTurnResume();
	}
	break;
}

} else {
	firstFrame = (actionTaking = -1);
}