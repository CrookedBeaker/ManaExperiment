/// @description Attempt to draw the thing

draw_sprite(spr_dbox,0,0,0);

draw_set_font(fnt_main_bold);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

draw_text(8,16,ds_list_find_value(log,3));
draw_text(8,28,ds_list_find_value(log,2));
draw_text(8,40,ds_list_find_value(log,1));
draw_text(8,52,ds_list_find_value(log,0));