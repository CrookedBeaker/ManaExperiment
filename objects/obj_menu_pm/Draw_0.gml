/// @description Draw all the party members and whatnot

var j = clamp(array_length(list)-(index-index%6),
	0,
	6); //Only have 6 appear at a time, depends on where you are on the list.
for (var i = 0; i < j; i++) {
	var current = list[i+(index-index%6)];
	
	draw_sprite(
		(room = rm_party_pc) ? spr_party_pc : spr_party_npc,
		current.spr,
		(i%2)*128+16,
		floor((i%6)/2)*64+48
	);
	
	draw_set_font(fnt_main_bold);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_orange);
	
	draw_text( //Name
		(i%2)*128+52,
		floor((i%6)/2)*64+48,
		current.name
	);
	
	draw_set_color(c_maroon);
	
	draw_text( //Class
		(i%2)*128+52,
		floor((i%6)/2)*64+60,
		current.class
	);
	
	draw_set_color(c_red);
	
	draw_text( //HP
		(i%2)*128+52,
		floor((i%6)/2)*64+72,
		"HP: "+string(current.hp)
	);
	
	draw_set_color(c_blue);
	
	if (current.ss != 0) {
		draw_text( //SS
			(i%2)*128+52,
			floor((i%6)/2)*64+84,
			"SS: "+string(current.ss)
		);
	}
	
}

//Draw an arrow if there's more
if (index-index%6) != 0 {draw_sprite(spr_party_arrow,0,128,40)};
if (array_length(list)-(index-index%6) > 6) {draw_sprite(spr_party_arrow,1,128,240)};

//Draw the header
draw_sprite(spr_party_header,(room != rm_party_pc),128,16);

draw_self();