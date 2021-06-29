/// @description Do things!
if !firstFrame {

if moving {
	if keyboard_check_pressed(vk_left) && (moved < move || moveOrigin[0] < x) {
		x -= 16;
	}
	
	if keyboard_check_pressed(vk_right) && (moved < move || moveOrigin[0] > x) {
		x += 16;
	}
	
	if keyboard_check_pressed(vk_up) && (moved < move || moveOrigin[1] < y) {
		y -= 16;
	}
	
	if keyboard_check_pressed(vk_down) && (moved < move || moveOrigin[1] > y) {
		y += 16;
	}
	
	if keyboard_check_pressed(ord("X")) { //Snap back to original position
		x = moveOrigin[0];
		y = moveOrigin[1];
		moving = false;
		firstFrame = true;
		TakeTurn();
	}
	
	if keyboard_check_pressed(ord("Z")) { //Confirm movement
		movedTurn += moved;
		moving = false;
		firstFrame = true;
		TakeTurn();
	}
	
	moved = (abs(x-moveOrigin[0])+abs(y-moveOrigin[1]))/16 + movedTurn;
}

} else {
	firstFrame = !moving;
}