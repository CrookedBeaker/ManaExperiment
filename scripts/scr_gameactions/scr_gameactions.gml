///Actions that can be taken in the game
global.aQueue = ds_queue_create();
global.lastHit = false;
global.lastRoll = 0;
global.lastDmgType = 0;

//Macros
//Die rolls
#macro dr_adv = 1;
#macro dr_normal = 0;
#macro dr_disadv = -1;

//Damage types
#macro dt_bludgeoning = 0;
#macro dt_slashing = 1;
#macro dt_piercing = 2;
#macro dt_fire = 3;
#macro dt_acid = 4;
#macro dt_cold = 5;
#macro dt_lightning = 6;
#macro dt_thunder = 7;
#macro dt_poison = 8;
#macro dt_necrotic = 9;
#macro dt_radiant = 10;
#macro dt_force = 11;

/*
	=Info Packets=
	This is how actions will be stored in the queue, as arrays.
	The following list will be how the different packets are formatted.
	
	Log Post: [0,"message"]
	Die Roll: [1,sides,number,modifier,advantage]
	Attack Check: [2,target,weapon]						(Done right after a die roll to contest AC)
	Damage Application: [3,target,type]					(Also done after a die roll, can only be created by an attack check.)
*/

//Clear it
function clearAcQueue() {
	ds_queue_clear(global.aQueue);
}

function queueLog(msg) {
	ds_queue_enqueue(global.aQueue,[0,msg]);
}

function queueDieRoll(sides,number,amod=0,adv=0) {
	ds_queue_enqueue(global.aQueue,[1,sides,number,amod,adv]);
}

function queueAttack(attacker,target) {
	queueDieRoll(weapGetDmgDie(attacker.character.weap),attacker.character.atk);
	ds_queue_enqueue(global.aQueue,[2,target,attacker.character.weap]);
}

function queueDamage(target,die,number,amod,type) {
	queueDieRoll(die,number,amod);
	ds_queue_enqueue(global.aQueue,[3,target,type]);
}

/*
function queueAttack(weapon,attacker,target,opportunity=false) {
	//Stop right there if out of melee range.
	if (weapGetType(weapon) = "Melee" && point_distance(attacker.x,attacker.y,target.x,target.y) > 16 && !opportunity) {
		queueLog("Target not in melee range.");
		attacker.action = true; //Give them their action back
		return;
	} else if (weapGetType(weapon) = "Ranged" && point_distance(attacker.x,attacker.y,target.x,target.y) < 32) {
		var tooClose = true;
	} else {
		var tooClose = false;
	}
	
	queueLog(attacker.character.name+" attacks "+target.character.name+"!");
	
	var atk = 0;
	switch target.status { //Any statuses to impose advantage or disadvantage?
		default:
			atk = queueDieRoll(20);
	}
	if (tooClose || target.spAction = 3) { //If too close for ranged stuff or dodging, it's on disadvantage.
		atk = queueRollDis();
		queueLog(attacker.character.name+" is at disadvantage!");
	}
	atk += attacker.character.atk;
	
	//Does it hit?
	if (atk >= target.character.ac) {
		var dmg = 0;
		switch attacker.character.weap { //What kind of weapon?
			case "Scimitars":
				dmg = queueDieRoll(6,attacker.character.dmg);
				break;
			case "Crossbow":
			case "Gauntlet":
			case "Rapier":
				dmg = queueDieRoll(8,attacker.character.dmg);
				break;
			case "Battleaxe":
			case "Warhammer":
				dmg = queueDieRoll(10,attacker.character.dmg);
		}
		
		queueLog(target.character.name+" takes "+string(dmg)+" damage!");
	} else {
		queueLog("...they miss.");
	}
}