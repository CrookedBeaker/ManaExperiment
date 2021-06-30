/// @description Roll Initiative!

var l = ds_list_create();

with obj_token_pm { //Get all combatants!
	ds_list_add(l,id);
}

ds_list_shuffle(l); //Shuffle 'em!
ds_list_copy(turnList,l);
ds_list_destroy(l);

//Add log entry
function Log(msg) {
	ds_list_insert(log,0,msg);
	
	while ds_list_size(log) > 4 {
		ds_list_delete(log,4);
	}
}

Log("");
Log("");
Log("");
Log("");

//DICE!!!
function RollDie(sides) {
	return irandom_range(1,sides);
}

function RollAdv() {
	var r1 = RollDie(20);
	var r2 = RollDie(20);
	return (r1 > r2) ? r1 : r2;
}

function RollDis() {
	var r1 = RollDie(20);
	var r2 = RollDie(20);
	return (r1 > r2) ? r2 : r1;
}

//Turn stuff
function NextTurn() {
	turn++;
	if turn >= ds_list_size(turnList) {turn = 0}
	
	//pmTurn = (ds_list_find_value(turnList,turn).object_index = obj_token_pm);
	
	with ds_list_find_value(turnList,turn) {
		TakeTurn();
	}
}

function Attack(attacker,target) {
	Log(attacker.character.name+" attacks "+target.character.name+"!")
	
	var atk = 0;
	switch target.status { //Any statuses to impose advantage or disadvantage?
		default:
			atk = RollDie(20);
	}
	atk += attacker.character.atk;
	
	//Does it hit?
	if (atk >= target.character.ac) {
		var dmg = 0;
		switch attacker.character.weap { //What kind of weapon?
			case "Crossbow":
			case "Gauntlet":
				dmg = RollDie(8);
		}
		dmg += attacker.character.dmg;
		target.hp -= dmg;
		
		Log(target.character.name+" takes "+string(dmg)+" damage!");
	} else {
		Log("...they miss.");
	}
}