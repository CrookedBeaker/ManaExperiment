/// @description Roll Initiative!

var l = ds_list_create();

with obj_token_pm { //Get all combatants!
	ds_list_add(l,id);
}

ds_list_shuffle(l); //Shuffle 'em!
ds_list_copy(turnList,l);
ds_list_destroy(l);

function NextTurn() {
	turn++;
	if turn >= ds_list_size(turnList) {turn = 0}
	
	//pmTurn = (ds_list_find_value(turnList,turn).object_index = obj_token_pm);
	
	with ds_list_find_value(turnList,turn) {
		TakeTurn();
	}
}