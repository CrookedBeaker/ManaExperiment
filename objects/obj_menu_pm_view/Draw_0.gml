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
draw_set_color(make_color_rgb(200,145,62));
	
draw_text( //Name
	52,
	48,
	character.name
);
	
draw_set_color(make_color_rgb(222,124,112));

draw_text( //Class
	52,
	60,
	character.class
);

draw_set_color(make_color_rgb(130,46,36));
	
draw_text( //HP
	52,
	72,
	"HP: "+string(character.hp)
);

draw_set_color(make_color_rgb(56,55,188));
	
if (totalSS(character) != 0) {
	draw_text( //SS
		52,
		84,
		"SS: "+string(totalSS(character))
	);
}

if (menuID == 0 && !hide) {
	draw_set_color(c_white);
	draw_text(8,112,character.desc);
} else if (menuID == 1) {
	draw_set_color(make_color_rgb(166,167,37));
	draw_text(8,112,"Weapon: "+character.weap);
}