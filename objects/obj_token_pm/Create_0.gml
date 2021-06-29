/// @description Set this dude up for battle!

function SetStuff(character) {
	image_index = character.spr;
	hp = character.hp;
	ss = character.ss;
}

SetStuff(character);

function TakeTurn() {
	sub = instance_create_depth(obj_camera.x-112,obj_camera.y+112,-1,obj_menu_battle);
	sub.par = id;
	
	with sub {
		SetMenu(0);
	}
}

function Move() {
	moving = true;
	moveOrigin = [x,y];
}