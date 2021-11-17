///Actions that can be taken in the game
global.aQueue = ds_queue_create();
global.lastHit = false;
global.lastRoll = 0;


//Clear it
function ClearAcQueue() {
	ds_queue_clear(global.aQueue);
}

function QueueLog(msg) {
	
}

function QueueDieRoll(sides,amod=0) {
	
}

function QueueRollAdv(amod=0) {
	
}

function QueueRollDis(amod=0) {
	
}

function QueueAttack(weapon,attacker,target,opportunity=false) {
	//Stop right there if out of melee range.
	if (weapGetType(weapon) = "Melee" && point_distance(attacker.x,attacker.y,target.x,target.y) > 16 && !opportunity) {
		QueueLog("Target not in melee range.");
		attacker.action = true; //Give them their action back
		return;
	} else if (weapGetType(weapon) = "Ranged" && point_distance(attacker.x,attacker.y,target.x,target.y) < 32) {
		var tooClose = true;
	} else {
		var tooClose = false;
	}
	
	QueueLog(attacker.character.name+" attacks "+target.character.name+"!");
	
	var atk = 0;
	switch target.status { //Any statuses to impose advantage or disadvantage?
		default:
			atk = QueueDieRoll(20);
	}
	if (tooClose || target.spAction = 3) { //If too close for ranged stuff or dodging, it's on disadvantage.
		atk = QueueRollDis();
		QueueLog(attacker.character.name+" is at disadvantage!");
	}
	atk += attacker.character.atk;
	
	//Does it hit?
	if (atk >= target.character.ac) {
		var dmg = 0;
		switch attacker.character.weap { //What kind of weapon?
			case "Scimitars":
				dmg = QueueDieRoll(6,attacker.character.dmg);
				break;
			case "Crossbow":
			case "Gauntlet":
			case "Rapier":
				dmg = QueueDieRoll(8,attacker.character.dmg);
				break;
			case "Battleaxe":
			case "Warhammer":
				dmg = QueueDieRoll(10,attacker.character.dmg);
		}
		
		QueueLog(target.character.name+" takes "+string(dmg)+" damage!");
	} else {
		QueueLog("...they miss.");
	}
}

function QueueDamage(target,dmg,type) {
	
}