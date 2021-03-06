///Actions that can be taken in the game
global.aQueue = ds_queue_create();
global.lastHit = false;
global.lastRoll = 0;
global.lastDmgType = 0;

//Macros
//Die rolls
#macro dr_adv 1
#macro dr_normal 0
#macro dr_disadv -1

//Damage types
#macro dt_bludgeoning 0
#macro dt_slashing 1
#macro dt_piercing 2
#macro dt_fire 3
#macro dt_acid 4
#macro dt_cold 5
#macro dt_lightning 6
#macro dt_thunder 7
#macro dt_poison 8
#macro dt_necrotic 9
#macro dt_radiant 10
#macro dt_force 11

//Special actions
#macro sa_none 0
#macro sa_dash 1
#macro sa_disengage 2
#macro sa_dodge 3

/*
	=Info Packets=
	This is how actions will be stored in the queue, as arrays.
	The following list will be how the different packets are formatted.
	
	Log Post: [0,"message"]
	Die Roll: [1,sides,number,modifier,advantage]
	Attack Check: [2,target,attacker,attacker's turn]	(Done right after a die roll to contest AC)
	Damage Application: [3,target,type]					(Also done after a die roll, can only be created by an attack check.)
	Resume Turn: [4,obj]								(Only added by the tokens themselves)
*/

function queueLog(msg) {
	ds_queue_enqueue(global.aQueue,[0,msg]);
}

function queueDieRoll(sides,number=1,amod=0,adv=0) {
	ds_queue_enqueue(global.aQueue,[1,sides,number,amod,adv]);
}

function queueAttack(attacker,target,attTurn=true) { //Keep in mind this uses token instance IDs as inputs!!!
	queueLog(attacker.character.name+" attacks "+target.character.name+"!");
	
	//Handle adventage and disadvantage
	if (target.spAction = sa_dodge) {
		queueLog(attacker.character.name+" is at a disadvantage!");
		queueDieRoll(20,1,attacker.character.atk,dr_disadv);
	} else {
		queueDieRoll(20,1,attacker.character.atk);
	}
	
	ds_queue_enqueue(global.aQueue,[2,target,attacker,attTurn]);
}

function queueDamage(target,die,number,amod,type) { //
	queueDieRoll(die,number,amod);
	ds_queue_enqueue(global.aQueue,[3,target,type]);
}

function queueTurnResume(token) { //Keep in mind this uses a token instance ID as input!!!
	ds_queue_enqueue(global.aQueue,[4,token]);
}