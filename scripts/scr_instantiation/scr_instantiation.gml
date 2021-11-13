///For instantiating certain objects

function menuMagic(x,character,spellLen) {
	var inst = instance_create_depth(x,240,depth-1,obj_menu_magic);
	inst.character = character; //Index in the global array
	//inst.npc = npc; //true or false
	inst.spellLen = spellLen; //0: all, 1: action, 2: bonus action
	
	return inst; //Return the instance
}