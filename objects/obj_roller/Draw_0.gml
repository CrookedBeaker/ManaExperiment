/// @description Draw some dice!

var s = 0;
if (sides > 3 && sides < 13) {
	s = 7-(sides/2);
}

for (var i=0; i<array_length(val); i++) {
	draw_sprite(spr_die,s,x+16*i,y);
	draw_text(x+16*i,y+8,string(val[i]));
}

draw_text(
	x+(array_length(val)-1)*16,
	y+8,
	(amod == 0) ? " + "+string(amod)+" = "+string(total) : " = "+string(total)
);