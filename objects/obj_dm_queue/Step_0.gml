/// @description Get the stuff rolling!

if !ds_queue_empty(global.aQueue) {
	if (!wait) { //Interpret queued actions
		var a = ds_queue_dequeue(global.aQueue);
		
		switch a[0] {
			case 0: //Log Post: [0,"message"]
				Log(a[1]);
				alarm[0] = 60; //Wait between actions
				break;
			case 1: //Die Roll: [1,sides,number,modifier,advantage]
				var inst = instance_create_depth(0,64,-5,obj_roller);
				inst.sides = a[1];
				inst.number = a[2];
				inst.amod = a[3];
				inst.adv = a[4];
				break;
			case 2: //Attack Check: [2,target,attacker,attacker's turn]
				if (global.lastRoll >= a[1].character.ac) { //"Does a 27 hit?"
					queueLog("...and hits!");
					queueDamage(
						a[1],
						weapGetDmgDie(a[2].character.weap),
						1,
						a[2].character.dmg,
						weapGetDmgType(a[2].character.weap)
					)
				} else {
					queueLog("...and misses.");
				}
				queueTurnResume(a[3] ? a[2] : a[1]); //Resume the correct turn
				alarm[0] = 1; //The next thing.
				break;
			case 3: //Damage Application: [3,target,type]
				var t = dmgTypeToString(a[2]);
				a[1].hp -= global.lastRoll;
				queueLog(a[1].character.name+" takes "+string(global.lastRoll)+" "+t+" damage!");
				alarm[0] = 1; //The next thing.
				break;
			case 4: //Resume Turn: [4,obj]
				with a[1] {
					TakeTurn();
				}
				alarm[0] = 1; //The next thing.
		}
		
		wait = true;
	}
} else {
	if turnOver {
		nextTurn();
		turnOver = false;
	}
}