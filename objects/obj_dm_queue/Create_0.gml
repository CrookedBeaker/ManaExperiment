/// @description Set up queued action interpretations
//Oh boy.
//Welp, nothing ventured, nothing gained.
//Let's do this shit.

var l = ds_list_create();

with obj_token_pm_queue { //Get all combatants!
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
Log("Roll Initiative!");

//Turn stuff
function nextTurn() {
	turn++;
	if turn >= ds_list_size(turnList) {turn = 0}
	
	with ds_list_find_value(turnList,turn) {
		TakeTurn();
	}
}

nextTurn();