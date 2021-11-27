/// @description Set this dude up for battle!

function SetStuff(character) {
	image_index = character.spr;
	hp = character.hp;
	ss = character.ss;
}

SetStuff(character);

function TakeTurn() {
	obj_ret.follow = id;
	obj_ret.controlled = false;
	obj_ret.hidden = false;
	
	spAction = sa_none;
	
	sub = instance_create_depth(obj_camera.x-112,obj_camera.y+112,-1,obj_menu_battle);
	sub.par = id;
	
	with sub {
		SetMenu(0);
	}
}

function Move() {
	actionTaking = 0;
	moveOrigin = [x,y];
}

function Attack() {
	actionTaking = 1;
	
	obj_ret.follow = noone;
	obj_ret.controlled = true;
}

function Dash() {
	spAction = sa_dash;
	queueLog(character.name+" dashes!");
	action = false;
}

function Disengage() {
	spAction = sa_disengage;
	queueLog(character.name+" disengages!");
	action = false;
}

function Dodge() {
	spAction = sa_dodge;
	queueLog(character.name+" takes evasive action!");
	action = false;
}