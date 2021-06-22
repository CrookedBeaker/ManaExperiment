/// @description Show us the deets!

draw_sprite(
	(room = rm_party_pc) ? spr_party_pc : spr_party_npc,
	character.spr,
	16,
	48
);

draw_set_font(fnt_main_bold);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_orange);
	
draw_text( //Name
	52,
	48,
	character.name
);
	
draw_set_color(c_maroon);

draw_text( //Class
	52,
	60,
	character.class
);

draw_set_color(c_red);
	
draw_text( //HP
	52,
	72,
	"HP: "+string(character.hp)
);

draw_set_color(c_blue);
	
if (character.ss != 0) {
	draw_text( //SS
		52,
		84,
		"SS: "+string(character.ss)
	);
}

if (menuID = 0) {
	draw_set_color(c_white);
	draw_text(8,112,character.desc);
}