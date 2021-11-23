/// @description Set up queued action interpretations
//Oh boy.
//Welp, nothing ventured, nothing gained.
//Let's do this shit.

//Add log entry
function log(msg) {
	ds_list_insert(log,0,msg);
	
	while ds_list_size(log) > 4 {
		ds_list_delete(log,4);
	}
}

//Interpret queue data
function nextAction() {
	var a = ds_queue_dequeue(global.aQueue);
	
	switch a[0] {
		case 0: //Log Post: [0,"message"]
			log(a[1]);
			break;
		case 1: //Die Roll: [1,sides,number,modifier,advantage]
			var inst = instance_create_depth(0,64,-5,obj_roller);
			inst.sides = a[1];
			inst.number = a[2];
			inst.amod = a[3];
			inst.adv = a[4];
			break;
		case 2: //Attack Check: [2,target,attacker]
			queueLog(a[2].character.name+" attacks "+a[1].character.name+"!");
			
			if (global.lastRoll >= a[1].character.ac) { //"Does a 27 hit?"
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
			break;
		case 3: //Damage Application: [3,target,type]
			var t = dmgTypeToString(a[2]);
			a[2].hp -= global.lastRoll;
			queueLog(a[1].character.name+" takes "+global.lastRoll+" "+t+" damage!");
	}
}