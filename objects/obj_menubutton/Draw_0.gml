/// @description Draw yourself
if !hide {

draw_self();

draw_set_font(fnt_main);
draw_set_color((par.sub = noone) ? c_white : c_gray);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x+sprite_width/2,y+10,label);

}